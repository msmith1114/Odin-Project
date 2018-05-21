def merge_sort(array)
  return array if array.size <= 1
  mid = array.length/2
  a = array[0...mid]
  b = array[mid..-1]
  a = merge_sort(a)
  b = merge_sort(b)
  merge(a,b)
end

def merge(a,b)
  merged_array = []
  #put in the smaller numbers from each array
  until a.empty? || b.empty?
    if a[0] <= b[0]
      merged_array << a.shift
    else
      merged_array << b.shift
    end
  end

  #fill in the rest
  until a.empty?
    merged_array << a.shift
  end
  until b.empty?
    merged_array << b.shift
  end
  merged_array
end

arr = [12,5,1,10,3,2,8,9,11,4,6,7]
puts "#{merge_sort(arr)}"
