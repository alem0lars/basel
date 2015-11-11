module Basel
  # Allow to run arbitrary basel commands.
  class Engine
    def initialize(commands)
      @commands = commands
    end

    # Instantiate the engine and start it.
    def self.start(commands, dryrun: false)
      new(commands).run dryrun
    end

    # Start the engine.
    def start(role: Target::SETUP, dryrun: false)
      @commands.each do |command|
        if dryrun
          command.dryrun(role)
        else
          command.run(role)
        end
      end
    end
  end
end
