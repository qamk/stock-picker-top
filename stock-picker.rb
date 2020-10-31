require 'pry'

def stock_picker(stock_list)
  # gets every pair of stocks in the order of the original array
  # this way we can simulate each potential buy-sell choice... kinda cool
  best_profit = 0
  best_pair =[]
  days = []

  
  
  stock_list.combination(2) do |combo|
    buy = combo[0]
    sell = combo[1]
    new_profit = sell-buy

    new_profit > best_profit ? (best_pair.clear and best_pair.push(buy,sell)) : next
    best_profit = new_profit
  end
  best_pair.each {|stock| days.push(stock_list.index(stock))}
  print "stocks: #{best_pair}\nOn days: #{days}\n"
  puts "For profit: #{best_profit}"

end

stock_picker([27,7,15,2,11,7,6,1,10])

# alt: looping through the list twice (outer + inner loop), permutations,
  # copying the list and going for the min and, using a substring, the max.
  # Drop values and repeat.