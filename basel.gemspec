lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "basel/version"

def read_part_from_readme(part)
  md = File.read("README.md").match %r{
    <!--\s*\{\s*#{part}\s*\}\s*--> # 1. Part preamble.
    [\s$]*(.+)[\s$]*               # 2. Part content.
    <!--\s*\{\s*#{part}\s*\}\s*--> # 3. Part epilogue.
  }
  md && md.length >= 1 ? md[1].chomp : nil
end

Gem::Specification.new do |spec|
  spec.name    = File.basename(__FILE__, ".gemspec")
  spec.version = Basel::Version::FULL
  spec.license = read_part_from_readme :license
  spec.authors = read_part_from_readme :name
  spec.email   = read_part_from_readme :email

  spec.homepage    = read_part_from_readme :homepage
  spec.summary     = read_part_from_readme :summary
  spec.description = read_part_from_readme :description

  spec.files         = `git ls-files -z`.split("\x0")
  spec.test_files    = spec.files.grep(%r{^spec/})
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "highline", "~> 1.7"

  spec.add_development_dependency "bundler", "~> 1.10"

  spec.add_development_dependency "awesome_print", "~> 1.6"

  spec.add_development_dependency "faker", "~> 1.5"

  spec.add_development_dependency "pry",        "~> 0.10"
  spec.add_development_dependency "pry-byebug", "~> 3.2"

  spec.add_development_dependency "rake",   "~> 10.4"
  spec.add_development_dependency "rspec",  "~> 3.3"
  spec.add_development_dependency "fuubar", "~> 2.0"

  spec.add_development_dependency "simplecov", "~> 0.10"

  spec.add_development_dependency "yard",      "~> 0.8"
  spec.add_development_dependency "redcarpet", "~> 3.3"

  spec.add_development_dependency "rubocop",       "~> 0.34"
  spec.add_development_dependency "rubocop-rspec", "~> 1.3"

  spec.add_development_dependency "guard",         "~> 2.13"
  spec.add_development_dependency "guard-rspec",   "~> 4.6"
  spec.add_development_dependency "guard-bundler", "~> 2.1"
  spec.add_development_dependency "guard-rubocop", "~> 1.2"
  spec.add_development_dependency "guard-yard",    "~> 2.1"
end
