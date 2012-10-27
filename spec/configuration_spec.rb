require "spec_helper"

module RockConfig
  describe Configuration do
    it "accepts scanned directories" do
      configuration = Configuration.new

      configuration.scanned_directories << "/custom/path"
      configuration.scanned_directories.should eq ["/custom/path"]
    end
  end
end
