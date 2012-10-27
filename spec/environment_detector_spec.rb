require "spec_helper"

module RockConfig
  describe EnvironmentDetector do
    it "detects rails' environment" do
      detector = EnvironmentDetector.new("RAILS_ENV" => "production")
      detector.detect.should eq("production")
    end

    it "detects rack's environment" do
      detector = EnvironmentDetector.new("RACK_ENV" => "production")
      detector.detect.should eq("production")
    end

    it "fallbacks to development environment if no other specified" do
      detector = EnvironmentDetector.new({})
      detector.detect.should eq("development")
    end
  end
end
