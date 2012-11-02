require "spec_helper"

module RockConfig
  describe YamlLoader do
    it "loads config when given valid path and filename" do
      directory = File.join(Dir.pwd, "spec", "fixtures") 

      loader = YamlLoader.new
      config = loader.find_at(directory, "database")

      config.should_not be_nil
    end
  end
end
