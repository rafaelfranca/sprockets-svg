require 'tempfile'
module Sprockets
  module Svg
    class Converter
      def self.call(env)
        svg_path = env[:filename]
        png_path = Tempfile.new('svg2png').path + '.png'

        image = Magick::ImageList.new(svg_path)
        image.write(png_path)
        File.read(png_path)
      end
    end
  end
end