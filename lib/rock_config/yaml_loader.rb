require "yaml"
require "erb"

module RockConfig
  class YamlLoader
    def find_at(directory, file_name)
      path = full_path(directory, file_name)

      if readable?(path)
        return Config.new(load_yaml_from(path))
      end
    end

    private

    def full_path(directory, file_name)
      File.join(directory, full_name(file_name))
    end

    def full_name(file_name)
      "#{file_name}.yml"
    end

    def readable?(path)
      File.exists?(path) && File.readable?(path)
    end

    def load_yaml_from(path)
      template = ERB.new File.read path
      YAML.load template.result binding
    rescue Exception => e
      raise ConfigLoadError, e.message
    end
  end
end
