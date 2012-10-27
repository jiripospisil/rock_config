require "rock_config/version"
require "rock_config/environment_detector"
require "rock_config/configuration"
require "rock_config/manager"

module RockConfig
  class ConfigNotFound < Exception; end

  class << self
    def for(config_name, environment = detect_environment)
      manager.fetch(config_name, environment) do
        raise ConfigNotFound, "Config not found"
      end
    end

    def configure
      yield configuration if block_given?
      @manager = nil
    end

    private

    def detect_environment
      @detected_environment ||= lambda do
        detector = EnvironmentDetector.new(ENV)
        detector.detect
      end.call
    end

    def configuration
      @configuration ||= Configuration.new
    end

    def manager
      @manager ||= Manager.new(configuration)
    end
  end
end
