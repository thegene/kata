require 'pry'
class ChangeMaker

  def ways_to_make_change(number)
    find_ways_in(number, all_coins)
  end

  def find_ways_in(number, coins_available, try=[])
    ways = []

    while coin = coins_available.shift do
      coin_count = (number - sum(try)) / coin

      while coin_count > 0 do
        new_way = try + Array.new(coin_count, coin)
        
        target = number - sum(new_way)

        if target == 0
          ways.push(new_way)
        elsif target > 0
          way = find_ways_in(number, coins_available.dup, new_way)
          ways.push(way.first) unless way.empty?
        end

        coin_count -= 1
      end
    end

    ways
  end

  private

  def all_coins
    [25, 10, 5, 1]
  end

  def sum(try)
    try.reduce(&:+) || 0
  end

end
