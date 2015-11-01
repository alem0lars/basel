lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "basel/version"

Gem::Specification.new do |spec|
  spec.name    = "basel"
  spec.version = Basel::Version::FULL
  spec.license = "Apache License Version 2.0"

  spec.authors = ["Alessandro Molari"]
  spec.email   = ["molari.alessandro@gmail.com"]

  spec.homepage    = "https://github.com/alem0lars/basel"
  spec.summary     = "Basel Automatic SEtup Language"
  spec.description = (<<-EOS).gsub(/\s{4}/, "")
    Define your setup with a custom DSL.
  EOS

  spec.files         = `git ls-files -z`.split("\x0")
  spec.test_files    = spec.files.grep(%r{^spec/})
  spec.bindir        = "bin"
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "colorize"
end
