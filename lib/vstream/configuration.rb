module Vstream
  require 'singleton'
  require 'yaml'
  
  class Configuration < Object
    include Singleton

    attr_reader :connection_host

    def initialize args
      super args

      self.parse_config
    end


    private 

    def from_document doc
      puts doc
    end

    def from_path path
      from_string YAML.load_file(path)
    end

  end

end
