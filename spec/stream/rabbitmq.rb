require 'spec_helper'

describe 'stream' do
  context 'rabbitmq' do

    let(:args) { { host: HOST } }
    let(:conn) { ConnectionFactory.connect RabbitMQ, args }

    it 'should connect' do
      vs = StreamFactory.connect RabbitMQ, {client: conn}
    end


  end
end
