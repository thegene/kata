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
          ways.push(new_way).flatten
        elsif target > 0
          way = find_ways_in(number, coins_available.dup, new_way)
          ways.push(way) unless way.empty?
        end
        #puts current_value(new_way).to_s + '  ' +
        #  new_way.join(', ') + ' : ' +
        #  coins_available.join(', ')
        coin_count -= 1
      end
    end
    return ways
  end

  private

  def current_value(try)
    try.reduce(&:+) || 0
  end

  def old_find_ways_in(number, coins, tracker = [])
    ways = 0
    coins.each do |coin|
      new_tracker = [coin] + tracker
      target = number - coin

      puts "N: #{number}, C: #{coin}, T: #{target}, #{coins.join(',')}"

      if target == 0 # we're done
        ways += 1
        puts "FOUND: #{new_tracker.join(',')}"

      elsif target >= coin # we can still try larger coin
        ways += find_ways_in(target, coins, new_tracker)

      elsif target > 0 # drop the larger coin
        coins.shift
        ways += find_ways_in(target, coins, new_tracker)
      end
    end
    return ways
  end

end
