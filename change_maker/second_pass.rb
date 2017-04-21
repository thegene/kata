module ChangeMaker
  class SecondPass

    def make_change_for(number)
      all_paths_for(number)
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

    def all_paths_for(value)
      coins = all_coins
      while coin = coins.shift
        combos_for_coin = combinations_for_coin(coin, value)

        puts combos_for_coin.inspect
      end
    end
  end
end
