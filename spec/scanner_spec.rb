require "spec_helper"

module RockConfig
  describe Scanner do
    let(:configuration) do
      configuration = Configuration.new
      configuration.scanned_directories << File.join(Dir.pwd, "config")
      configuration.config_loaders << YamlLoader.new
      configuration
    end

    let(:scanner)       { Scanner.new(configuration) }
    let(:fixtures_path) { File.join(Dir.pwd, "spec", "fixtures") }

    it "finds nothing when the target doesnt exist" do
      expect do
        scanner.find("database")
      end.to raise_error(ConfigNotFound)
    end

    it "scans additional directories" do
      configuration.scanned_directories << fixtures_path
      scanner.find("database").should_not be_nil
    end
  end
end
