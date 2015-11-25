require "engine/configurator"

class HazelConfigurator < Configurator
  protected

  def install
    brew_install pkg:  "hazel",
                 cask: true
  end

  def configure_startupitem
    startupitem_add name: File.join Dir["/opt/homebrew-cask/Caskroom/hazel/*"].sort.last,
                                    "Hazel.prefPane", "Contents", "MacOS", "HazelHelper.app"
  end
end
