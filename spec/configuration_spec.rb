require "spec_helper"

module RockConfig
  describe Configuration do
    it "accepts scanned directories" do
      configuration = Configuration.new

      configuration.scanned_directories << "/custom/path"
      configuration.scanned_directories.should include "/custom/path"
    end

    it "accepts config loaders" do
      configuration = Configuration.new

      configuration.config_loaders << "duck"
      configuration.config_loaders.should include "duck"
    end
  end
end
