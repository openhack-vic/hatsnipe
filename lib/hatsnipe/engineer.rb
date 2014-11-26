require 'socket'

module Hatsnipe
  class Engineer
    def initialize
      @socket = UNIXServer.new("/tmp/hatsnipe.sock")
    end
    def nest
      begin
        while connection = @socket.accept
          while command = connection.gets
            command = command.split(':').first
            puts command
          end
        end
      rescue SystemExit, Interrupt
        @socket.close
      end
    end
  end
end
