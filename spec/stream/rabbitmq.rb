require 'spec_helper'

describe 'stream' do
  context 'rabbitmq' do


    let(:queue_name)   { 'test.stream.rabbitmq' }
    let(:stream) { Stream.new route: queue_name }
    let(:payload) { {test: 'test'} }

    after :each do
      stream.clear
      stream.close
    end

    it 'should connect' do
      stream.should_not be nil
      stream.client.should_not be nil
    end

    it 'should publish' do
      stream.offer( payload )
      stream.size.should be 1
    end

    it 'should clear' do
      stream.offer( payload )
      stream.offer( payload )
      stream.size.should eq 2

      stream.empty?.should be false
      stream.clear
      stream.empty?.should be true
    end

    it 'should peek' do
      stream.offer( payload )
      stream.size.should eq 1
    end

    it 'should peek' do
      stream.offer( payload )
      stream.size.should eq 1
    end


  end
end
