require 'vstream'

HOST='127.0.0.1'

RSpec.configure do |config|
  config.formatter = :documentation 
  
  config.expect_with :rspec do |c|
    c.syntax = [:should, :expect]
  end
end