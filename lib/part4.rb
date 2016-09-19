class Class
  def attr_accessor_with_history(attr_name)
    attr_name = attr_name.to_s   # make sure it's a string
    attr_reader attr_name        # create the attribute's getter
    attr_reader attr_name + "_history" # create name_history getter
    class_eval "def #{attr_name}=(val);@#{attr_name}=val;@#{attr_name}_history.push(val);end"
  end
end

class Dessert
  def initialize
    @name_history = ['nil']
  end
  attr_accessor_with_history :name
end



