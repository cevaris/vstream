module Vstream
  class Vstream < Object
    attr_reader :client

    def initialize(args)
      super args

      self.init
    end

    def init
      raise 'Please define a "route" name.' unless @route
      
      @client   = Bunny.new :host => '127.0.0.1'
      @client.start

      @channel  = @client.create_channel
      @queue    = @channel.queue("", :exclusive => true)
      @exchange = @channel.default_exchange
    end

    def element  ;end
    def offer(e) ;end
    def peek     ;end
    def poll     ;end
    def remove   ;end
    # Clears all elements from the queue
    def clear    ;end
    def size     ;end

    # Closes client connection
    def close    ;end
  end

  class Stream < Vstream

    def element  ;end
    def offer(e)
      @exchange.publish(e.to_s, :routing_key => @queue.name)
    end
    def peek     ;end
    def poll     ;end
    def remove   ;end
    def size    
      @queue.message_count 
    end
    def clear  
      @queue.purge  
    end
    def close
      @client.close
    end


  end
end
