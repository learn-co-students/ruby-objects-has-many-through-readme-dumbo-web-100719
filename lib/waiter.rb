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
    end

    def best_tipper
        best_tipper_instance = meals.reduce(nil) do |memo, meal|
            if memo == nil
                memo = meals[0]
            end

            if meal.tip > memo.tip
                memo = meal
            end
            memo
        end
        best_tipper_instance.customer

    end



end