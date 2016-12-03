require 'pry'
class ChangeMaker
  attr_accessor :ways, :memo

  def initialize
    @ways = []
    @memo = {}
  end

  def ways_to_make_change(number)
    find_ways_in(number, all_coins)
  end

  private

  def find_ways_in(number, coins, try=[])
    value = sum(try)
    target = number - value

    if value == number
      ways.push(try)
    else
      find_for_each_coin(number, coins.dup, try)
    end

    ways
  end

  def find_for_each_coin(number, coins, try)
    while coin = coins.shift do
      coin_count = (number - sum(try)) / coin

      for i in (1..coin_count).to_a.reverse
        new_way = try + Array.new(i, coin)

        find_ways_in(number, coins.dup, new_way)
      end
    end
  end

  def all_coins
    [25, 10, 5, 1]
  end

  def sum(try)
    try.reduce(&:+) || 0
  end

end
