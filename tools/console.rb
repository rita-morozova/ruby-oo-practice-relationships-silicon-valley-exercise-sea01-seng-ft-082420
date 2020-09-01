require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

a1 = Startup.new("apple", "Jim H", "d1")
a2 = Startup.new("banana", "Cathy L", "d2")
a3 = Startup.new("veggie", "Michael S", "d3")


mark = VentureCapitalist.new("Mark Z", 450000000)
martha = VentureCapitalist.new("Martha S", 3700)
daniel = VentureCapitalist.new("Daniel F", 260000000000000)

c1 = FundingRound.new(a1, mark, "A", 450000)
c2 = FundingRound.new(a3, daniel, "B", 5500)
c3 = FundingRound.new(a1, daniel, "A", 324566)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line

