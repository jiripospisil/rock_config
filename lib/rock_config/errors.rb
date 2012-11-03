module RockConfig
  class Error < StandardError; end
  class ConfigLoadError < Error; end
  class ConfigNotFoundError < Error; end
end
