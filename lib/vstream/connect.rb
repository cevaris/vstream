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
