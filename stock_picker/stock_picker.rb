def stock_picker(arr)
  max = 0
  arrMax = []
  arr.each.with_index {|buy,index|
    arr[index..-1].each.with_index {|sell,index2|
      if buy-sell < max && index < (index+index2)
        max = buy-sell
        arrMax = []
        arrMax.push(index,index+index2)
      end
    }
  }
  puts "#{arrMax} # for a profit of $#{arr[arrMax[1]]} - $#{arr[arrMax[0]]} == #{max*-1}"
end


stock_picker([13,3,96,9,15,8,6,1,10])
stock_picker([17,3,6,9,15,4,3,7,14,6,78])
stock_picker([140,205,6,8,9,30,2,200,123])
stock_picker([17,3,6,9,15,8,6,1,10])
