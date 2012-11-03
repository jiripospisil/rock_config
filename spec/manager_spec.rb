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

    it "raises error if the config doesnt have the environment"  do
      result = mock("Config")
      result.should_receive(:send).with("development") { nil }

      scanner = mock("Scanner")
      scanner.should_receive(:new) .with(configuration) { scanner }
      scanner.should_receive(:find).with("sample")      { result }

      manager = Manager.new(configuration, scanner)
      expect do
        manager_result  = manager.fetch "sample", "development"
      end.to raise_error(EnvironmentNotFoundError)
    end
  end
end
