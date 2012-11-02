require "rock_config/version"
require "rock_config/environment_detector"
require "rock_config/configuration"
require "rock_config/manager"
require "rock_config/scanner"

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
      @configuration ||= initialize_configuration
    end

    def initialize_configuration
      configuration = Configuration.new

      configuration.scanned_directories << File.join(Dir.pwd, "config")
      configuration.config_loaders << YamlLoader.new

      configuration
    end

    def manager
      @manager ||= Manager.new(configuration)
    end
  end
end
