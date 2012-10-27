class EnvironmentDetector
  def initialize(environment)
    @environment = environment
  end

  def detect
    @environment["RAILS_ENV"] || @environment["RACK_ENV"] || "development"
  end
end
