require "engine/utils"
require "engine/commands_executor"

#
# The entry-point.
#
class Engine
  include Utils

  def initialize
    @commands_executor = CommandsExecutor.new
  end

  #
  # Start the entry-point.
  #
  def run(dryrun)
    yield(@commands_executor)
    @commands_executor.execute_commands(dryrun)
  end

  #
  # Instantiate the entry-point and start it.
  #
  def self.run(dryrun: false, &block)
    new.run(dryrun, &block)
  end
end
