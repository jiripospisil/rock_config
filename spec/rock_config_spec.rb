require "spec_helper"

module RockConfig
  describe RockConfig do
    it "it loads valid configs" do
      RockConfig.configure do |config|
        config.scanned_directories << File.join(Dir.pwd, "spec", "fixtures")
        config.config_loaders << YamlLoader.new
      end

      RockConfig.for("database", "development").magic_number.should eq(213)
    end
  end
end
