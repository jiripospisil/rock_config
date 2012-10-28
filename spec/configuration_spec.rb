require "spec_helper"

module RockConfig
  describe Configuration do
    it "has default scanned directory" do
      configuration = Configuration.new
      configuration.scanned_directories.count.should eq 1
    end

    it "accepts scanned directories" do
      configuration = Configuration.new

      configuration.scanned_directories << "/custom/path"
      configuration.scanned_directories.should include "/custom/path"
    end
  end
end
