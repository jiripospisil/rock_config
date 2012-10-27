module RockConfig
  class Configuration
    attr_accessor :scanned_directories

    def initialize
      @scanned_directories = []
    end
  end
end
