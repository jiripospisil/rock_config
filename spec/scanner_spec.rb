require "spec_helper"

module RockConfig
  describe Scanner do
    it "finds nothing when the target doesnt exist" do
      configuration = Configuration.new
      scanner       = Scanner.new(configuration)

      scanner.find("database").should be_nil
    end

    it "scans additional directories" do
      fixtures_path = File.join(Dir.pwd, "spec", "fixtures")

      configuration = Configuration.new
      configuration.scanned_directories << fixtures_path

      scanner = Scanner.new(configuration)

      scanner.find("database").should_not be_nil
    end
  end
end
