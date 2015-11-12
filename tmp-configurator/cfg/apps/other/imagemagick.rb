require "engine/configurator"

class ImageMagickConfigurator < Configurator
  protected

  def install
    brew_install pkg: "imageoptim",
                 opts: %w(
                   --with-fftw --with-fontconfig --with-hdri --with-jp2
                   --with-liblqr --with-libtiff --with-libwmf --with-little-cms
                   --with-little-cms2 --with-openexr --with-perl --with-webp
                 )
  end
end
