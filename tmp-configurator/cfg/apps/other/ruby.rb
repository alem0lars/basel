require "engine/configurator"

class RubyConfigurator < Configurator
  protected

  def install
    brew_install pkg: %w(libyaml readline openssl)  # Dependencies.
    brew_install pkg: "ruby-build" # Allow to install custom ruby versions.
    brew_install pkg: "rbenv"
    brew_install pkg: %w(rbenv-gem-rehash rbenv-default-gems rbenv-whatis
                         rbenv-aliases rbenv-vars) # Install rbenv extensions.
    gem_install pkg: %w(irbtools irbtools-more) # For preinstalled ruby.
  end

  def configure
    fizzy repo: "git@github.com:alem0lars/configs-ruby",
          cfg:  "ruby",
          inst: "ruby",
          meta: "meta",
          vars: "alem0lars-osx"
  end
end
