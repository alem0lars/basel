require "engine/configurator"

class MathTypeConfigurator < Configurator
  protected

  def install
    brew_install pkg: "mathtype", cask: true
    custom msg: "Run installer",
         open: "/opt/homebrew-cask/Caskroom/mathtype/*/MTM*.pkg" # TODO Find path
  end
end
