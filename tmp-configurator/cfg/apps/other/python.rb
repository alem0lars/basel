require "engine/configurator"

class PythonConfigurator < Configurator
  protected

  def install
    brew_install pkg: %w(pyenv)
    brew_install pkg: %w(pyenv-which-ext pyenv-virtualenv) # pyenv extensions.
    pip_install pkg: %w(virtualenv ipython pylama pylama_pylint), user: true
  end

  def configure
    # TODO: configure ipython
  end
end
