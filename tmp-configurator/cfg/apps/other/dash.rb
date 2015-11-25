require "engine/configurator"

class DashConfigurator < Configurator
  protected

  def install
    brew_install pkg:  "dash",
                 cask: true
    # TODO: see https://kapeli.com/dash_install
    dash_install pkg: [
             ".NET Framework", "Akka", "Ansible", "Android", "AppleScript", "Arduino",
             "Bash", "Boost", "C", "Chef", "C++", "Clojure", "CMake", "CoffeeScript",
             "CSS", "Docker", "Go", "Elixir", "Haskell", "HTML", "JavaSE8", "JavaFX",
             "JavaScript", "jQuery", "Julia", "LaTeX", "Less", "Markdown", "Font Awesome", "Foundation",
             "Gradle DSL", "Gradle Groovy API", "Gradle Java API", "Gradle User Guide",
             "Gulp", "Matplotlib",
             "Man Pages", "MongoDB", "Mono", "MySQL", "NodeJS", "NumPy", "PHP",
             "Perl", "PostgreSQL", "Python 2", "Python 3", "Qt5", "R", "React",
             "Redis", "Ruby 2", "Rust", "SASS", "Scala", "SQLite", "Stylus",
             "SVG", "Twisted", "UnderscoreJS", "Vagrant", "Vim", "Groovy", "Groovy JDK"
           ],
           manual: true
  end

  def configure_settings
    # TODO
  end

  def configure_startupitem
    startupitem_add name: "/Applications/Dash.app"
  end
end
