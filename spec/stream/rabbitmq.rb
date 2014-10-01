require 'spec_helper'

describe 'stream' do
  context 'rabbitmq' do

    let(:queue_name)   { 'test.stream.rabbitmq' }
    let(:stream) { Stream.new route: queue_name }

    after :each do
      stream.clear
      stream.close
    end


    it 'should connect' do
      stream.should_not be nil
      stream.client.should_not be nil
    end

    it 'should publish' do
      stream.offer(1234)
      stream.size == 1
    end


  end
end
