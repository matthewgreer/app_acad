class AttrAccessorObject
  def self.my_attr_accessor(*names)
    # names is instance variable(s)
    # for each name, I would write #name to return @name
    # and I would write #name=(var) to make @name = var
    names.each do |name|

      define_method("#{name}") do               # <= 'getter'
        gettified = instance_variable_get("@#{name}")
        return gettified
      end

      define_method("#{name}=") do |value|      # <= 'setter'
        settified = instance_variable_set("@#{name}", value)
        return true
      end

    end
  end
end
