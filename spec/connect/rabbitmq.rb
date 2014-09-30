require 'spec_helper'

describe 'connection' do
  context 'rabbitmq' do

    let(:args) { { host: 'localhost' } }


    it 'should connect' do
      conn = Vstream::ConnectionRabbitMQ.new args
    end


  end
end
