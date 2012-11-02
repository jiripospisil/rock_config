module RockConfig
  class Config
    def initialize(hash)
      @hash = hash
    end

    def method_missing(*args, &block)
      if value = @hash[args.first.to_s]
        if Hash === value
          Config.new(value)
        else
          value
        end
      end
    end

    def raw
      @hash.dup
    end
  end
end
