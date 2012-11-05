require "spec_helper"

module RockConfig
  describe Manager do
    let(:configuration) do 
      configuration = Configuration.new
      configuration.scanned_directories << File.join(Dir.pwd, "spec", "fixtures")
      configuration.config_loaders << YamlLoader.new

      configuration
    end

    it "returns config if found" do
      manager = Manager.new(configuration)
      manager_result  = manager.fetch "database", "test"
      manager_result.should_not be_nil
    end

    it "raises error if the config doesnt have the environment"  do
      manager = Manager.new(configuration)
      manager_result  = manager.fetch "database", "development"

      expect do
        manager_result  = manager.fetch "database", "me no exist yo"
      end.to raise_error(EnvironmentNotFoundError)
    end
  end
end
