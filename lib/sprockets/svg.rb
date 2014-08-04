require 'sprockets/svg/version'

require 'nokogiri'
require 'RMagick'

module Sprockets
  module Svg
    extend self

    def install(assets)
      assets.register_preprocessor 'image/svg+xml', :svg_min do |context, data|
        Sprockets::Svg::Cleaner.process(data)
      end
      assets.register_transformer 'image/svg+xml', 'image/png', Sprockets::Svg::Converter
    end

  end
end

require_relative 'svg/cleaner'
require_relative 'svg/converter'
require_relative 'svg/railtie' if defined?(Rails)
