require "spec_helper"

module RockConfig
  describe YamlLoader do
    it "loads config when given valid path and filename" do
      directory = File.join(Dir.pwd, "spec", "fixtures") 

      loader = YamlLoader.new
      config = loader.find_at(directory, "database")

      config.should_not be_nil
    end

    it "evaluates erb expression within the file" do
      directory = File.join(Dir.pwd, "spec", "fixtures")

      ENV['magic_number'] = '213'
      loader = YamlLoader.new
      config = loader.find_at(directory, "database_erb")
      config.raw['development']['magic_number'].should eq(213)
    end

    it "throws exception when given valid path to an invalid file" do
      directory = File.join(Dir.pwd, "spec", "fixtures") 
      loader = YamlLoader.new

      expect do
        config = loader.find_at(directory, "database_invalid")
      end.to raise_error(RockConfig::ConfigLoadError)
    end
  end
end
