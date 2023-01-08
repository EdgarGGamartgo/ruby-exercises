def stock_picker(days)
    buyable_days = days.sort
    sellable_days = days.sort.reverse

    sell_day_idx = nil
    buy_day_idx = nil

    sellable_days.each_with_index do |sorted_day, idx|
        sell_day_idx = days.find_index { |day| day == sorted_day }

        buy_day_idx = days.find_index { |day| day == buyable_days[idx] }

        if buy_day_idx < sell_day_idx then break end
    end

    [buy_day_idx, sell_day_idx]
end

p stock_picker([17,3,6,9,15,8,6,1,10])