class ChangeMaker

  def ways_to_make_change(number, tracker=[])
    ways = 0
    coins.each do |coin|
      new_tracker = tracker + [coin]
      target = number - coin
    puts "[ #{new_tracker.join(', ')} ] = #{new_tracker.reduce(&:+)}"
    puts "number: #{number} - #{coin} = #{target}"

      if coin <= target && target > 0
        ways += ways_to_make_change(target, new_tracker)
      elsif target == 0
        ways += 1
    puts "[ #{new_tracker.join(', ')} ] = #{new_tracker.reduce(&:+)}"
      end
    end

    return ways
  end

  def coins
    [25, 10, 5, 1]
  end
end
