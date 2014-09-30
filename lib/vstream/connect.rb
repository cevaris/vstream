module Vstream
  
  class Connection < Object
    def open(args)  ;end
    def close ;end
  end

  class ConnectionRabbitMQ < Connection

    def initialize(args)
      super args
      puts args
      puts @host
      # @client = AMQP.connect(:host => '127.0.0.1')
    end

    def open(args)
    end

    def close
    end
  end

end
