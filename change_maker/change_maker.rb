class ChangeMaker
  def make_change_for(number)
    all_combos_with(number, [25, 10, 5, 1])
  end

  def all_combos_with(target, coins)
    [].tap do |combos|
      while coin = coins.shift
        parts = get_parts_for(target, coin)
        parts.each do |part|
          new_target = target - sum(part)

          new_parts = all_combos_with(new_target, coins.dup)
          if new_parts.empty?
            combos << part
          else
            new_parts.each do |new_part|
              combos << part + new_part
            end
          end

        end
      end
    end
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
