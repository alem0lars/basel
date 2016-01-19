require "engine/configurator"

class DockerConfigurator < Configurator
  protected

  def install
    brew_install pkg:  "dockertoolbox",
                 cask: true
    npm_install pkg: "dockerlint"
  end

  def configure
    custom msg:  "Quickstart (choose 'iTerm (Always)')"
           open: "/Applications/Docker/Docker Quickstart Terminal.app",
           manual: true
    # TODO: The following commands should be run inside the docker shell
    custom msg: "Get token", cmd: "docker swarm run create"
    # docker-machine create \
    #     -d virtualbox \
    #     --swarm \
    #     --swarm-master \
    #     --swarm-discovery token://<TOKEN-FROM-ABOVE> \
    #     swarm-master
  end
end
