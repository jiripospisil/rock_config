module RockConfig
  class Scanner
    def initialize(configuration)
      @configuration = configuration
    end

    def find(file_name)
      full_file_name = resolve_full_file_name(file_name)

      @configuration.scanned_directories.each do |directory|
        file = File.join(directory, full_file_name)
        if File.exists? file
          return File.read file
        end
      end

      nil
    end

    private

    def resolve_full_file_name(file_name)
      "#{file_name}.yml"
    end
  end
end
