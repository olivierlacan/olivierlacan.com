require "pry"

module Jekyll
  module Converters
    class Markdown
      class RedcarpetParser

        module CommonMethods
          def add_code_tags(code, lang)
            code = code.to_s
            # replace the first instance of <pre> in the string
            code["<pre>"] = <<-HTML
              <pre><code class="language-#{lang}" data-lang="#{lang}">
            HTML

            # replace the last instance of </pre> in the string
            code[code.rindex(/<\/pre>/)..-1] = <<-HTML
              </code></pre>
            HTML

            code
          end
        end

        module WithPygments
          include CommonMethods
          def block_code(code, lang)
            Jekyll::External.require_with_graceful_fail("pygments")

            lang = lang && lang.split.first || "text"

            add_code_tags(
              Pygments.highlight(code, lexer: lang, options: { encoding: 'utf-8' }),
              lang
            )
          end
        end

        module WithoutHighlighting
          require 'cgi'

          include CommonMethods

          def code_wrap(code)
            <<-HTML
              <figure class="highlight">
                <pre>
                  #{CGI::escapeHTML(code)}
                </pre>
              </figure>
            HTML
          end

          def block_code(code, lang)
            lang = lang && lang.split.first || "text"
            add_code_tags(code_wrap(code), lang)
          end
        end

        module WithRouge
          def block_code(code, lang)
            code = "<pre>#{super}</pre>"

            output = <<-HTML
              <div class="highlight">
                #{add_code_tags(code, lang)}
              </div>
            HTML
          end

          def header(text, header_level)
            slug = text.gsub(" ", "-").downcase
            tag_name = "h#{header_level}"
            anchor_link = "<a id='#{slug}' class='anchor' href='##{slug}' aria-hidden='true'></a>"
            header_tag_open = "<#{tag_name} id='#{slug}'>"

            output = ""
            output << header_tag_open
            output << anchor_link
            output << text
            output << "</#{tag_name}>"

            output
          end

          protected
          def rouge_formatter(lexer)
            Rouge::Formatters::HTML.new(wrap: false, line_numbers: true)
          end
        end


        def initialize(config)
          External.require_with_graceful_fail("redcarpet")
          @config = config
          @redcarpet_extensions = {}
          @config['redcarpet']['extensions'].each { |e| @redcarpet_extensions[e.to_sym] = true }

          @renderer ||= class_with_proper_highlighter(@config['highlighter'])
        end

        def class_with_proper_highlighter(highlighter)
          case highlighter
          when "pygments"
            Class.new(Redcarpet::Render::HTML) do
              include WithPygments
            end
          when "rouge"
            Class.new(Redcarpet::Render::HTML) do
              Jekyll::External.require_with_graceful_fail(%w[
                rouge
                rouge/plugins/redcarpet
              ])

              unless Gem::Version.new(Rouge.version) > Gem::Version.new("1.3.0")
                abort "Please install Rouge 1.3.0 or greater and try running Jekyll again."
              end

              include Rouge::Plugins::Redcarpet
              include CommonMethods
              include WithRouge
            end
          else
            Class.new(Redcarpet::Render::HTML) do
              include WithoutHighlighting
            end
          end
        end

        def convert(content)
          @redcarpet_extensions[:fenced_code_blocks] = !@redcarpet_extensions[:no_fenced_code_blocks]
          @renderer.send :include, Redcarpet::Render::SmartyPants if @redcarpet_extensions[:smart]
          markdown = Redcarpet::Markdown.new(@renderer.new(@redcarpet_extensions), @redcarpet_extensions)
          markdown.render(content)
        end
      end
    end
  end
end
