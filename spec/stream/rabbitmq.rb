require 'spec_helper'

describe 'stream' do
  context 'rabbitmq' do

    let(:args) { { host: HOST } }

    it 'should connect' do
      conn = Vstream::Stream.new, args
      conn.should_not be nil
      conn.client.host.should eq(HOST)
    end


  end
end
