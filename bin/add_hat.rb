require 'hatsnipe'
require 'socket'
sock = UNIXSocket.new '/tmp/hatsnipe.sock'
sock.write "addhat:the best hats"
