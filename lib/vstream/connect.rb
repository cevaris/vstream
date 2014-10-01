require 'singleton'

class ConnectionType; end
class RabbitMQ < ConnectionType; end

class ConnectionFactory  
  def self.connect conn, args
    case conn
    when RabbitMQ.class
      return Vstream::ConnectionRabbitMQ.new args
    else
      raise "#{conn} failed to match"
    end
  end
end

module Vstream  
  class Connection < Object
    attr_reader :client

    def open(args)  ;end
    def close ;end
  end

  class ConnectionRabbitMQ < Connection
    def initialize(args)
      super args
      
      @client = Bunny.new :host => '127.0.0.1'
    end

    def open(args)
    end

    def close
    end
  end
end
