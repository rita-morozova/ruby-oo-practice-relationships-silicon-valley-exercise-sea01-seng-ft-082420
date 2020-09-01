class Startup
    attr_accessor :name
    attr_reader :founder_name, :domain
    @@all = []

    def initialize(name,founder_name, domain)
        @name = name
        @founder_name = founder_name
        @domain = domain
        @@all << self
    end

    def self.all
        @@all
    end

    def pivot(new_domain, new_name)
        @domain = new_domain
        @name = new_name
    end  

    def self.find_by_founder(name)
        FundingRound.all.find {|fr| fr.venture_capitalist == name}
    end 

    def self.domains
        self.all.map {|fr| fr.domain}.uniq
    end  

    def sign_contract(venture_capitalist, type, investment)
        FundingRound.new(self, venture_capitalist, type, investment)
    end 

    def num_funding_rounds 
        FundingRound.all.select {|fr| fr.startup == self}.count
    end 

    def my_startup
        FundingRound.all.select {|fr| fr.startup == self}
    end 

    def total_funds
        my_startup.map {|i| i.investment}.reduce(:+)
    end 

    def investors
       my_investors = my_startup.map {|i| i.venture_capitalist}.uniq
    end 

    def big_investors
       self.investors && VentureCapitalist.tres_commas_club
    end 

end

