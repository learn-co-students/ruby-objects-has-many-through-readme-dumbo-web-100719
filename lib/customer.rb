require 'pry'

class Customer
  attr_reader :name, :age
  @@all = []
  
  def initialize(name, age)
    @name = name
    @age = age
    @@all << self
  end

  def self.all
    @@all
  end

  def new_meal(waiter, total, tip)
    Meal.new(waiter, self, total, tip)
  end

  def meals
    Meal.all.select { |meal|  meal.customer == self  }
  end

  def waiters
    waiter_array = []
    self.meals.each do |meal| 
      waiter_array << meal.waiter
    end
    waiter_array
  end


end

