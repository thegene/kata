module ChangeMaker
  class SecondPass

    def make_change_for(number)
      all_paths_for(number, all_coins)
    end

    private

    def all_coins
      [25, 10, 5, 1]
    end

    def combinations_for_coin(coin, value)
      total_in_value = value / coin
      combos = []

      if coin == 1
        combos << [coin] * total_in_value
      else

        while total_in_value > 0 do
          combos << [coin] * total_in_value
          total_in_value -= 1
        end

      end

      combos
    end

    def all_paths_for(value, coins)
      [].tap do |paths|
        while coin = coins.shift
          combos = combinations_for_coin(coin, value)
          combos.each do |combo|
            new_value = find_new_value_from_combo(combo, value)

            if new_value == 0
              paths << combo
            else
              secondary_paths = all_paths_for(new_value, coins.dup)
              secondary_paths.each do |secondary|
                paths << combo + secondary
              end
            end
          end

        end
      end
    end

    def find_new_value_from_combo(combo, original_value)
      original_value - combo.reduce(0, :+)
    end
  end
end
