class Dessert
  def initialize(name, calories)
    if name.length == 0
      raise ArgumentError.new("Dessert name must be provided")
    end
    if calories <= 0
      raise ArgumentError.new("Calories must be greater than or equal to 0")
    end
    @name = name
    @calories = calories
  end

  def name=(new_name) # setter
    if new_name.length == 0
      raise ArgumentError.new("Dessert name must be provided")
    end
    @name = new_name
  end

  def calories=(new_calories) # setter
    if new_calories <= 0
      raise ArgumentError.new("Calories must be greater than or equal to 0")
    end
    @calories = new_calories
  end

  def name # getter
    @name
  end

  def calories # calories
    @calories
  end
  
  def healthy?
    if calories < 200
      true
    else
      false
    end
  end
  
  def delicious?
    true
  end
end

class JellyBean < Dessert
  def initialize(name, calories, flavor)
    super(name, calories)
    @flavor = flavor
  end

  def flavor=(new_flavor)
    @flavor=new_flavor
  end

  def flavor # getter for flavor
    @flavor
  end
  
  def delicious?
    if flavor == 'black licorice'
      false
    else
      true
    end
  end
end
