class Meal

    @@all = []

    attr_accessor :name, :customer, :waiter, :tip

    def initialize(waiter,customer,total,tip=0)
        @waiter = waiter
        @customer = customer
        @total = total
        @tip = tip
        @@all << self
    end
    
    def self.all
        @@all
    end
end