def my_each
  for i in 0...self.length do
    yield(self[i])
  end
  return self
end

def my_each_with_index
  for i in 0...self.length do
    yield(self[i],i)
  end
  return self
end

def my_select
  arr = []
  for i in 0...self.length do
    if yield(self[i])
      arr << self[i]
    end
  end
  return arr
end

def my_all?
  all = true
  for i in 0...self.length do
    if !yield(self[i])
      all = false
    end
  end
  return all
end

def my_any?
  any = false
  if !block_given?
    self.my_each {|collection| any = true if collection}
  else
    for i in 0...self.length do
      if yield(self[i])
        any = true
      end
    end
  end
  return any
end

def my_none?
  none = true
  if !block_given?
    self.my_each {|collection| none = false unless !collection}
  else
    for i in 0...self.length do
      if yield(self[i])
        none = false
      end
    end
  end
  return none
end

def my_map(&proc)
  arr = []
  if block_given?
    self.my_each {|x| arr << proc.call(x)}
  else
    return self
  end
  arr
end

def my_inject(memo = nil)
  memo = self[0] if memo.nil?
  for i in 0...self.length do
    puts "#{memo}:#{self[i]} Results=#{yield(memo,self[i])}"
    memo = yield(memo,self[i])
  end
  return memo
end
