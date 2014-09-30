require 'spec_helper'

HOST='127.0.0.1'

describe 'connection' do
  context 'rabbitmq' do

    let(:args) { { host: HOST } }

    it 'should connect' do
      conn = Vstream::ConnectionRabbitMQ.new args
      conn.should_not be nil
      conn.client.host.should eq(HOST)
    end


  end
end
