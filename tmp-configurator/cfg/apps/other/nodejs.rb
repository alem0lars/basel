require "engine/configurator"

class NodeJSConfigurator < Configurator
  protected

  def install
    brew_install pkg: "node"
                 opts: "--with-openssl"
    # Common tools.
    npm_install pkg: "bower"
  end
end
