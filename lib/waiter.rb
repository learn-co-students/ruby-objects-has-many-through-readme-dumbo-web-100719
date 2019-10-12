class Waiter
    attr_accessor :name, :yrs_experience

    @@all = []

    def initialize(name, yrs_experience)
        @name = name
        @yrs_experience = yrs_experience
        @@all << self
    end

    def self.all 
        @@all
    end

    def new_meal(customer, total, tip)
        Meal.new(self, customer, total, tip)
    end

    def meals
        Meal.all.select do |meal|
            meal.waiter == self
        end
        #returns an array of all of the meals served by this waiter
    end

    def best_tipper
        #return the customer instance associated w/ that meal
        biggest_tip = 0
        tipper = nil

        meals.each do |meal|
                
                if meal.tip > biggest_tip
                    biggest_tip = meal.tip
                    tipper = meal.customer
                    # binding.pry
                end
        end
        tipper
        # binding.pry
        # tipper
        
    end

end