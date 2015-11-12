require "engine/configurator"

class ImageOptimConfigurator < Configurator
  protected

  def install
    # Install dependencies.
    npm_install pkg: "svgo"
    brew_install pkg: %w(
      jpeg jhead jpegoptim pngquant pngcrush pngout optipng advancecomp
      zopfli gifsicle
    )

    brew_install pkg: "imageoptim",
                 cask: true
  end
end
