require "spec_helper"

module RockConfig
  describe Manager do
    let(:configuration) { Configuration.new }

    it "returns config if found" do
      result = mock("Config")
      result.should_receive(:send).with("development") { "yay" }

      scanner = mock("Scanner")
      scanner.should_receive(:new) .with(configuration) { scanner }
      scanner.should_receive(:find).with("sample")      { result }

      manager         = Manager.new(configuration, scanner)
      manager_result  = manager.fetch "sample", "development"

      manager_result.should eq("yay")
    end

    it "returns nul if config not found" do
      scanner = mock("Scanner")
      scanner.should_receive(:new) .with(configuration) { scanner }
      scanner.should_receive(:find).with("sample")      { nil }

      manager = Manager.new(configuration, scanner)

      manager.fetch("sample", "development").should be_nil
    end
  end
end
