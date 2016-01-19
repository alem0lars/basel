require "engine/configurator"

class LuaConfigurator < Configurator
  protected

  def install
    brew_install pkg:  "lua",
                 options: %w(--with-completion)
    luarocks_install pkg: "luacheck"
  end
end
