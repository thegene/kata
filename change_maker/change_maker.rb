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
      while coin = coins.shift do
        coin_count = (number - sum(try)) / coin

        while coin_count > 0 do
          new_try = Array.new(coin_count, coin)
          new_way = try + new_try

          find_ways_in(number, coins.dup, new_way)

          coin_count -= 1
        end
      end
    end

    ways
  end

  def all_coins
    [25, 10, 5, 1]
  end

  def sum(try)
    try.reduce(&:+) || 0
  end

end
