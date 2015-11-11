module Basel
  module Target
    class Atomic < Base
      attr_reader :name

      def initialize(name)
        @name = name.to_s.dup.to_sym # defensive copy.
      end

      # Match is based on the name.
      def match?(other)
        name == other.name if other.is_a? Atomic
      end
    end
  end
end
