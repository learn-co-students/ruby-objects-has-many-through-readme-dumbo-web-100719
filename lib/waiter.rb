require 'pry'
require_relative 'customer'
require_relative 'meal'


class Waiter
 
    attr_accessor :name, :yrs_experience
   
    @@all = []
   
    def initialize(name, yrs_experience)
      @name = name
      @yrs_experience = yrs_experience
      @@all << self
    end
   
    def meals
      Meal.all.select do |meal|
        meal.waiter == self #checking for waiter now
      end
    end

    def new_meal(customer, total, tip=0)
      Meal.new(self, customer, total, tip)
    end

    def best_tipper
      best_tipped_meal = meals.max do |meal_a, meal_b|
        meal_a.tip <=> meal_b.tip
      end
     
      best_tipped_meal.customer
    end

    def most_freq_customer
      cust_count = Hash.new(0) #creates a new hash, sets its default values to 0.
      meals.each do |meal|
        cust_count[meal.customer] +=1
        # output
#         {#<Customer:0x00007faf1f06d850 @age=27, @name="Terrance">=>1,
#  #<Customer:0x00007faf1f06d8f0 @age=24, @name="Lisa">=>3,
#  #<Customer:0x00007faf1f06d8a0 @age=35, @name="Tim">=>1}
      end
      cust_count.sort_by {|customer, count| count}.last[0]
      #output
      #<Customer:0x00007f8a3dc09620 @age=24, @name="Lisa">
      
        
    end

    def self.all
      @@all
      
    end
   
  end

jason = Waiter.new("Jason", 4)
natalie = Waiter.new("Natalie", 1)
lisa = Customer.new("Lisa", 24)
tim = Customer.new("Tim", 35)
terrance = Customer.new("Terrance", 27)

terrance.new_meal(jason, 50, 3)
lisa.new_meal(jason, 40, 10)
lisa.new_meal(jason, 40, 10)
lisa.new_meal(jason, 40, 10)
lisa.new_meal(natalie, 40, 10)
tim.new_meal(natalie, 45, 8)
tim.new_meal(jason, 45, 8)

best_t = jason.best_tipper
best_tn = jason.best_tipper.name

most_fre = jason.most_freq_customer


# binding.pry