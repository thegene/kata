class ChangeMaker

  def ways_to_make_change(number)
    find_ways_in(number, [25, 10, 5, 1])
  end

  def find_ways_in(number, coins)
    ways = 0
    coins.each do |coin|
      target = number - coin

      puts "N: #{number}, C: #{coin}, T: #{target}, #{coins.join(',')}"

      if target == 0 # we're done
        ways += 1

      elsif target >= coin # we can still try larger coin
        ways += find_ways_in(target, coins)

      elsif target > 0 # drop the larger coin
        coins.shift
        ways += find_ways_in(target, coins)
      end
    end
    return ways
  end

end
