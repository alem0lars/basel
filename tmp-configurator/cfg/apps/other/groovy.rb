require "engine/configurator"

class GroovyConfigurator < Configurator
  protected

  def install
    brew_install pkg:  "groovy",
                 opts: %w(--with-invokedynamic)
  end
end
