module Basel
  module Target
    class Base
      def match?(other)
        raise NotImplementedError
      end
    end
  end
end
