class Waiter
  attr_reader :name, :exp
  @@all = []
  
  def initialize(name, exp)
    @name = name
    @exp = exp
    @@all << self
  end

  def self.all
    @@all
  end

  def new_meal(customer, total, tip)
    Meal.new(self, customer, total, tip)
  end

  def meals
    Meal.all.select { |meal|  meal.waiter == self  }
  end

  def best_tipper
    best_tipped_meal = self.meals[0]
    self.meals.each do |meal| 
      best_tipped_meal = meal if meal.tip > best_tipped_meal.tip
    end
    best_tipped_meal.customer
  end

end