#
# Base class to define configurators.
#
class Configurator
  attr_reader :data

  def self.all() @all ||= [] end
  def self.inherited(configurator) all << configurator end

  def initialize(command_executor, data)
    @command_executor = command_executor
    @data = data
    required_data.each do |elem|
      error("`#{elem}` isn't available.") unless @data.has_key?(elem)
    end
  end

  #
  # Run the current executor, by calling configuration methods.
  #
  # Conventions:
  #  - Installation method is optional and it should be called `install`.
  #  - Configuration methods should start with `configure`.
  #
  def run
    install if methods.include?(:install)
    methods.select { |m| m.to_s.start_with?("configure") }
           .each   { |m| send(m) }
  end

  #
  # The configurator priority.
  #
  # Note:
  #   - Lower values mean more priority.
  #   - `nil` is the lowest priority.
  #
  def priority() nil end

  #
  # Compare configurators using their priority.
  #
  def <=>(other)
    p1, p2 = priority, other.priority
    p1 == p2 ? 0 : p1.nil? ? 1 : p2.nil? ? -1 : p1 <=> p2
  end

  #
  # Forward missing method calls to the command executor.
  #
  def method_missing(method_name, *arguments, &block)
    if @command_executor.respond_to?(method_name)
      @command_executor.send(method_name, *arguments)
    else
      super(method_name, *arguments, &block)
    end
  end

  protected

  #
  # The data keys required for the current command executor.
  #
  # Default: no data is required.
  #
  def required_data() [] end
end
