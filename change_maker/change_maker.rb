require 'pry'
class ChangeMaker

  def ways_to_make_change(number)
    find_ways_in(number, [25, 10, 5, 1])
  end

  def find_ways_in(number, coins_available, try=[])
    ways = []


    while coin = coins_available.shift do
      coin_count = (number - current_value(try)) / coin

      while coin_count > 0 do
        new_way = try + Array.new(coin_count, coin)
        
        target = number - current_value(new_way)

        if target == 0
          ways.push(new_way)
        elsif target > 0
          way = find_ways_in(number, coins_available.dup, new_way)
          ways.push(way.first) unless way.empty?
        end

        coin_count -= 1
      end
    end
    return ways
  end

  private

  def current_value(try)
    try.reduce(&:+) || 0
  end

end
