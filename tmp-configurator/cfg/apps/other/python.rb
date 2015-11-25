require "engine/configurator"

class PythonConfigurator < Configurator
  protected

  def install
    brew_install pkg: %w(pyenv)
    brew_install pkg: %w(pyenv-which-ext pyenv-virtualenv) # pyenv extensions.
    pip_install pkg: %w(virtualenv ipython pylama pylama_pylint), user: true
  end

  # TODO: check zsh for:
  # if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
  # export PYENV_ROOT=/usr/local/var/pyenv
  # if which pyenv-virtualenv-init > /dev/null; then eval "$(pyenv virtualenv-init -)"; fi

  def configure
    # TODO: configure ipython
  end
end
