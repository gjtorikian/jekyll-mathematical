require 'math-to-itex'
require 'mathematical'

module Jekyll
  module Converters
    class Mathematical < Converter
      priority :highest

      def matches(ext)
        ext =~ /^\.md$/i
      end

      def output_ext(ext)
        ".html"
      end

      def convert(content)
        MathToItex(content).convert do |eq, type|
          svg_content = ::Mathematical::Render.new(:base64 => true).render(eq)

          %|<img class="#{type.to_s}-math" data-math-type="#{type.to_s}-math" src="#{svg_content['svg']}"/>|
        end
      end
    end
  end
end