module RockConfig
  class Config
    def initialize(hash)
      @hash = hash
    end

    def [](key)
      fetch(key)
    end

    def method_missing(name, *args, &block)
      fetch(name.to_s)
    end

    def raw
      @hash.dup
    end

    private

    def fetch(key, default = nil)
      if value = @hash[key.to_s]
        return value_or_config(value)
      end
    end

    def value_or_config(value)
      if Hash === value
        Config.new(value)
      else
        value
      end
    end
  end
end
