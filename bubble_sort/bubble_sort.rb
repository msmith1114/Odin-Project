def bubble_sort(arr)
  swapped = false
  loop do
    swapped = false
    (arr.length-1).times.with_index { |num, index|
      if arr[index] > arr[index + 1]
        arr[index], arr[index + 1] = arr[index + 1], arr[index]
        swapped = true
      end
    }
    if !swapped
      break
    end
  end
  arr
end

def bubble_sort_by(arr)
  swapped = false
  loop do
    swapped = false
    (arr.length-1).times.with_index { |num, index|
      if yield(arr[index],arr[index+1]) > 0
        arr[index], arr[index + 1] = arr[index + 1], arr[index]
        swapped = true
      end
    }
    if !swapped
      break
    end
  end
  arr
end

bubble_sort_by(["hi","hello","hey","i"]) do |left,right|
  left.length - right.length
end

puts bubble_sort([5,6,1,6,3,9,10,1,3,4,8,7])
