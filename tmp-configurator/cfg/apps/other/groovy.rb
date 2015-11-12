require "engine/configurator"

class GroovyConfigurator < Configurator
  protected

  def install
    brew_install pkg:  "groovy",
                 opts: %w(--with-invokedynamic)
  end

  def configure
    # TODO: export GROOVY_HOME=/usr/local/opt/groovy/libexec
  end
end
