require 'socket'

module Hatsnipe
  class Engineer

    def initialize
      @socket_file = '/tmp/hatsnipe.sock'
      @socket = UNIXServer.new @socket_file
    end
    def nest
      begin
        while connection = @socket.accept
          while command_text = connection.gets
            command_name, args = command_text.split(':')
            command = CommandFactory.create_command command_name, (args || '').split('|')
            command.execute
          end
        end
      rescue SystemExit, Interrupt
        @socket.shutdown
        File.delete @socket_file
      end
    end

    class CommandFactory
      def self.create_command command_name, args
        case command_name
        when 'addhat'
          AddHatCommand.new args
        else
          raise "CantFindCommand"
        end
      end
    end

    class AddHatCommand
      def initialize args
        @args = args
      end

      def execute
        puts @args
      end
    end
  end
end
