require "spec_helper"

module RockConfig
  describe Manager do
    before do
      @configuration = Configuration.new
    end

    it "returns config if found" do
      result = double("Config")
      result.should_receive(:for_environment).with("development").and_return("yay")

      scanner = double("Scanner")
      scanner.should_receive(:new).with(@configuration).and_return(scanner)
      scanner.should_receive(:find).with("sample").and_return(result)

      manager         = Manager.new(@configuration, scanner)
      manager_result  = manager.fetch "sample", "development"

      manager_result.should eq("yay")
    end

    it "yields if config not found" do
      scanner = double("Scanner")
      scanner.should_receive(:new).with(@configuration).and_return(scanner)
      scanner.should_receive(:find).with("sample").and_return(nil)

      manager = Manager.new(@configuration, scanner)
      lambda do
        manager_result = manager.fetch "sample", "development" do
          raise Exception
        end
      end.should raise_error(Exception)
    end
  end
end
