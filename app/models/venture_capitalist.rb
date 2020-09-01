class VentureCapitalist
    attr_reader :name, :total_worth
    @@all = []

    def initialize(name, total_worth)
        @name = name
        @total_worth = total_worth 
        @@all << self
    end

    def self.all
        @@all
    end

    def self.tres_commas_club
        self.all.select {|vc| vc.total_worth > 1000000000}
    end 

    def offer_contract(startup, type, investment)
        FundingRound.new(startup, self, type, investment)
    end 

    def funding_rounds
        FundingRound.all.select {|fr| fr.venture_capitalist == self}
    end 

    def portfolio
       self.funding_rounds.map {|fr| fr.startup}.uniq
    end 

    def biggest_investment
        self.funding_rounds.map {|i| i.investment}.max
    end 

end
