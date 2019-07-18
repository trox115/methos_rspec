module Enumerable
  def my_each
    if self.class == Range
      arr = self.to_a
    else
      arr = self
    end
    i = 0
    until arr[i].nil?
      yield(arr[i])
      i += 1
    end
    arr
  end

  def my_each_with_index
    i = 0
    until self[i].nil?
      yield(self[i], i)
      i += 1
     
    end
    self
  end

  def my_select
    ari = []
    my_each do |x|
      ari.push(x) if yield x
    end
    ari
  end

  def my_all?
    flag = true
    my_each do |x|
      flag = false unless yield x
    end
    flag
  end

  def my_any?
    flag = false
    my_each do |x|
      flag = true if yield x
    end
    flag
  end

  def my_none?
    flag = true
    my_each do |x|
      flag = false if yield x
    end
    flag
  end

  def my_count(arg=nil)
    if block_given?
      i = 0
      my_each do |x|
        i += 1 if yield x
      end
    elsif arg != nil
      i = 0
      self.my_each do |x|
        i += 1 if x == arg
      end
    else
        i = 1
        i += 1 until self[i].nil?
    end
    i
  end

  def my_map(proc = nil)
    # no_enumerator = block_given?
    ari = []
    if proc

      my_each do |x|
        ari.push(proc.call(x))
      end
    else

      my_each do |x|
        ari.push(yield x)
      end
    end
    ari
  end

  def my_inject
    first = true
    sum = 0
    self.my_each do | n |
        if first
            sum = n
            first = false
        else
            sum = yield(sum , n)
        end
    end
    return sum
  end
end