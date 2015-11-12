require "engine/configurator"

class BulkRenameConfigurator < Configurator
  protected

  def install
    appstore action: :install,
             name:   "Better Rename 9"
  end
end
