module BlockConfigurable
  class Configuration
    def add_config(param, default = nil)
      instance_eval %Q{
        def #{param}
          @#{param}
        end

        def #{param}=(value)
          @#{param} = value
        end
      }
      
      instance_variable_set "@#{param}", default
    end

    def to_h
      instance_variables.reduce(Hash.new) do |a, e|
        a.merge(e[1..-1].to_sym => instance_variable_get(e))
      end
    end

    alias_method :to_hash, :to_h
  end
end
