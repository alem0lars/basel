require "engine/configurator"

class JavaConfigurator < Configurator
  protected

  def install
    brew_install pkg:  "javafx-scene-builder",
                 cask: true
    # Install maven.
    brew_install pkg: "maven"
    # Install ivy.
    brew_install pkg: "ant",
                 opts: %w(--with-bcel --with-ivy)
    brew_install pkg: "ant-contrib"
  end
end
