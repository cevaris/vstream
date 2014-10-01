class StreamType; end
class RabbitMQ < StreamType; end

class StreamFactory  
  def self.get stream, args
    case stream
    when RabbitMQ.class
      return Vstream::StreamRabbitMQ.new args
    else
      raise "#{stream} failed to match"
    end
  end
end

module Vstream
  class Stream < Object
    attr_reader :client

    def initialize(args)
      super args
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
