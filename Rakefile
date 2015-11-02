# Prepare environment for requiring gems.
require "rubygems"
require "bundler/setup"
# Require third-party tasks.
require "bundler/gem_tasks"
require "rake"
require "rake/clean"
require "rspec/core/rake_task"
require "yard"
require "rubocop/rake_task"
# Require other core / third-party dependencies.
require "yaml"
require "pathname"
# Require the project main module.
require "basel"

RSpec::Core::RakeTask.new

RuboCop::RakeTask.new

YARD::Rake::YardocTask.new(:doc)

task :default do
  system("rake -sT")
end

desc "Open a console."
task :console do
  sh "pry --gem", verbose: false
end

task validate: %w(rubocop spec doc)
