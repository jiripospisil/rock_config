require "rock_config/scanner"

module RockConfig
  class Manager
    def initialize(configuration, scanner = Scanner)
      @scanner = scanner.new(configuration)
      @configs = initialize_configs
    end

    def fetch(config_name, environment)
      if config = @configs[config_name]
        config.for_environment environment
      else
        yield if block_given?
      end
    end

    def initialize_configs
      Hash.new do |hash, key|
        if config = @scanner.find(key)
          hash[key] = config
        end
      end
    end
  end
end
