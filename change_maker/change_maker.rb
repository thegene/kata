class ChangeMaker

  def ways_to_make_change(number)
    ways = 0

    coins.each do |coin|
      target = number - coin
      if target > 0
        ways += ways_to_make_change(target)
      elsif target == 0
        ways = 1
      end
    end

    return ways
  end

  def coins
    [25, 10, 5, 1]
  end
end
