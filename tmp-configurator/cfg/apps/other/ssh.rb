require "engine/configurator"

class SSHConfigurator < Configurator
  protected

  def install
    brew_install pkg: "autossh"
    brew_install pkg: "mosh"
  end

  def configure
    lpass_save_note name: "ssh?host=julia&user=alem0lars&type=private",
                    path: "~/.ssh/id_rsa"
    lpass_save_note name: "ssh?host=julia&user=alem0lars&type=public",
                    path: "~/.ssh/id_rsa.pub"
    chmod mode: "660",
          path: %w(~/.ssh/id_rsa ~/.ssh/id_rsa.pub)
  end
end
