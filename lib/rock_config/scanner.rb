module RockConfig
  class Scanner
    def initialize(configuration)
      @configuration = configuration
    end

    def find(file_name)
      @configuration.scanned_directories.each do |directory|
        @configuration.config_loaders.each do |loader|
          if config = loader.find_at(directory, file_name)
            return config
          end
        end
      end

      raise ConfigNotFoundError, "Config not found"
    end
  end
end
