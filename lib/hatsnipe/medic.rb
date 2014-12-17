module Hatsnipe
  class Medic
    attr_accessor :hat_watches

    def initialize
      @hat_watches = []
    end

    def add_hat name, price
      @hat_watches.push HatWatch.new(name, price)
    end

    private
    class HatWatch
      def initialize name, price
        @name = name
        @price = price
      end
    end
  end
end
