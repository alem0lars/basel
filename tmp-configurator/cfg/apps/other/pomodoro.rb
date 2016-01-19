require "engine/configurator"

class PomodoroConfigurator < Configurator
  protected

  def install
    appstore action: :install,
             name:   "Pomodoro Time Pro"
  end

  def configure_user
    custom msg: "Perform login"
  end

  def configure_startupitem
    startupitem_add name: "/Applications/Pomodoro Time Pro.app"
  end
end
