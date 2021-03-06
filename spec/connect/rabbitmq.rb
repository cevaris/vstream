require 'spec_helper'

describe 'connection' do
  context 'rabbitmq' do

    let(:args) { { host: HOST } }

    it 'should connect' do
      conn = ConnectionFactory.connect RabbitMQ, args
      conn.should_not be nil
      conn.client.host.should eq(HOST)
    end


  end
end
