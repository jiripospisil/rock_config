require "spec_helper"

module RockConfig
  describe Scanner do
    let(:configuration) { Configuration.new }
    let(:scanner)       { Scanner.new(configuration) }
    let(:fixtures_path) { File.join(Dir.pwd, "spec", "fixtures") }

    it "finds nothing when the target doesnt exist" do
      scanner.find("database").should be_nil
    end

    it "scans additional directories" do
      configuration.scanned_directories << fixtures_path
      scanner.find("database").should_not be_nil
    end
  end
end
