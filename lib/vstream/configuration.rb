module Vstream
  require 'singleton'
  require 'yaml'
  
  class Configuration < Object
    include Singleton

    attr_reader :connection_host

    def initialize args
      super args

      from_path @path if @path
    end


    private 

    def self.from_document doc
      puts doc
    end

    def self.from_path path
      from_string YAML.load_file(path)
    end

  end

end
