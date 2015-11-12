root_path = File.expand_path(File.dirname(__FILE__))

$:.insert(0, root_path)

require "pathname"

require "engine/main"
require "cfg/hardware"
require "cfg/system"
require "cfg/apps/core"
Dir["#{root_path}/cfg/apps/other/*.rb"].map do |p|
  require Pathname.new(p).relative_path_from(Pathname.new(root_path)).to_s.gsub(/\.rb$/, "")
end

Engine.run(dryrun: ARGV.include?("--dryrun")) do |e|
  data = {
    hostname:     e.ask("What's your hostname"),
    homepage:     "https://google.com",
    text_editor:  "Atom",
    image_editor: "Pixelmator",
    font_name:    "Menlo-Regular",
    font_size:    12,
    wallpaper:    "http://alycia-carey.com/gallery/albums/The%20100/Stills/2x07/007.jpg",
    irc_username: "alem0lars",
    fullname:     "Alessandro Molari"
  }
  Configurator.all.map { |c| c.new(e, data) }.sort.each { |c| c.run }
end
