require "pry-byebug"
require "awesome_print"
require "simplecov"

# Require basel.
$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "basel"

# Require specs support.
spec_dir_path = Pathname.new(__FILE__).expand_path.dirname
$LOAD_PATH.unshift spec_dir_path.to_s
Dir[spec_dir_path.join("support", "**", "*.rb").to_s].each { |f| require f }

# Measure code coverage.
SimpleCov.minimum_coverage 100
SimpleCov.coverage_dir("out/docs/coverage")
SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter[
    SimpleCov::Formatter::HTMLFormatter
]
SimpleCov.start

RSpec.configure do |config|
  config.order = :random
  config.color = true
  config.formatter = "Fuubar"

  config.mock_with :rspec do |c|
    c.syntax = :expect
  end

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end
