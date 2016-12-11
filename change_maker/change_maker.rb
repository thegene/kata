class ChangeMaker

  def make_change_for(number)
    all_combos_with(number, [25, 10, 5, 1])
  end

  def all_combos_with(target, coins)
    combos = []

    while coin = coins.shift
      combos_for_coin = []

      parts = get_parts_for(target, coin)
      parts.each do |part|
        remainder = target - sum(part)

        if remainder == 0
          combos_for_coin << part
        else

          new_parts = all_combos_with(remainder, coins.dup)
          new_parts.each do |new_part|
            combos_for_coin << part + new_part
          end

        end

      end

      combos += combos_for_coin
    end

    combos
  end

  def get_parts_for(target, coin)
    [].tap do |parts|
      count = target / coin
      if coin == 1
        parts << Array.new(count, coin)
      else
        while count > 0 do
          parts << Array.new(count, coin)
          count -= 1
        end
      end
    end
  end

  def sum(array)
    array.reduce(&:+) || 0
  end
end
