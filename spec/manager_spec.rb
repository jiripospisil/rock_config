require "spec_helper"

module RockConfig
  describe Manager do
    let(:configuration) { Configuration.new }

    it "returns config if found" do
      result = mock("Config")
      result.should_receive(:for_environment).with("development") { "yay" }

      scanner = mock("Scanner")
      scanner.should_receive(:new) .with(configuration) { scanner }
      scanner.should_receive(:find).with("sample")      { result }

      manager         = Manager.new(configuration, scanner)
      manager_result  = manager.fetch "sample", "development"

      manager_result.should eq("yay")
    end

    it "yields if config not found" do
      scanner = mock("Scanner")
      scanner.should_receive(:new) .with(configuration) { scanner }
      scanner.should_receive(:find).with("sample")      { nil }

      manager = Manager.new(configuration, scanner)

      expect do
        result = manager.fetch "sample", "development" do
          raise Exception
        end
      end.to raise_error(Exception)
    end

  end
end
