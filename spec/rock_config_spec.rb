require "spec_helper"

module RockConfig
  describe RockConfig do
    it "it loads valid configs" do
      RockConfig.configure do |config|
        config.scanned_directories << File.join(Dir.pwd, "spec", "fixtures")
        config.config_loaders << YamlLoader.new
      end

      config = RockConfig.for("database", "development")
      config.magic_number.should eq(213)
      config.test_false.should == false
      config.test_true.should == true
    end
  end
end
