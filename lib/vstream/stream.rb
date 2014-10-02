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
      @queue    = @channel.queue(@route, :exclusive => true)
      @exchange = @channel.default_exchange
    end

    # Queue interface
    def element  ;end
    def offer(e) ;end
    def peek     ;end
    def poll     ;end
    def remove   ;end
    
    # Collection interface
    def clear    ;end
    def size     ;end
    def empty?   ;end

    # Closes client connection
    def close    ;end
  end

  class Stream < Vstream

    def offer(e)
      @exchange.publish(e.to_json, :routing_key => @queue.name)
    end
    def peek
      # _, _, content = @queue.pop(:manual_ack => true)
      _, _, content = @channel.basic_get(@queue.name, manual_ack: false)
      begin
        JSON.parse(content)  
      rescue JSON::ParserError => e
        content        
      end
    end
    def element
      raise "Queue is empty" if empty?
      self.peek
    end
    def poll     ;end
    def remove   ;end

    def empty?
      self.size == 0
    end
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
