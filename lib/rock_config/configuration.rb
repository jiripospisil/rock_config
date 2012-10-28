module RockConfig
  class Configuration
    attr_accessor :scanned_directories

    def initialize
      default_directory = File.join(Dir.pwd, "config")
      @scanned_directories = [default_directory]
    end
  end
end
