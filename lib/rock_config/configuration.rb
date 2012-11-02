module RockConfig
  class Configuration
    attr_accessor :scanned_directories, :config_loaders

    def initialize
      @scanned_directories = []
      @config_loaders = []
    end
  end
end
