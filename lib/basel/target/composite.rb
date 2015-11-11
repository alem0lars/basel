module Basel
  module Target
    class Composite < Base
      def initialize(*targets)
        @children = targets.dup # defensive copy.
      end

      # The `other` target matches if at least one of the subtargets matches it.
      def match?(other)
        @children.any? { |child| child.match?(other) || other.match?(child) }
      end
    end
  end
end
