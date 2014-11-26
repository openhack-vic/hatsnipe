module Hatsnipe
  class Engineer
    def initialize
    end
    def nest
      loop do
        puts "Snoozing"
        sleep(5)
      end
    end
  end
end
