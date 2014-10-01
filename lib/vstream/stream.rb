module Vstream
  class Stream < Object
    attr_reader :client

    def initialize(args)
      super args
      @client = ConnectionRabbitMQ.new args
    end

    def element  ;end
    def offer(e) ;end
    def peek     ;end
    def poll     ;end
    def remove   ;end
  end

  class StreamRabbitMQ

  end
end
