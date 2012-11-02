require "yaml"

module RockConfig
  class YamlLoader
    def find_at(directory, file_name)
      full_name = full_name(file_name)
      full_path = File.join(directory, full_name)

      if readable?(full_path)
        return Config.new(load_yaml_from(full_path))
      end
    end

    private

    def full_name(file_name)
      "#{file_name}.yml"
    end

    def readable?(path)
      File.exists?(path) && File.readable?(path)
    end

    def load_yaml_from(path)
      YAML.load(File.read(path))
    end
  end
end
