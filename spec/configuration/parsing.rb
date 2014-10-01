require 'spec_helper'

describe 'configuration' do
  let(:args) { { path: 'spec/resources/test.conf'} }
  context 'parsing' do


    it 'should parse' do
      conf = Vstream::Configuration.new args
    end


  end
end
