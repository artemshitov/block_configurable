require 'block_configurable/configuration'
require "block_configurable/version"

module BlockConfigurable
  module ClassMethods
    def configuration
      @configuration ||= Configuration.new
    end

    def configurable(param, default = nil)
      configuration.add_config(param, default)
    end

    def configure(&block)
      yield(configuration)
    end
  end
  
  def self.included(receiver)
    receiver.extend ClassMethods
    receiver.send :private_class_method, :config
  end
end
