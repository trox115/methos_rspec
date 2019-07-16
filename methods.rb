module Enumerable
  def my_each
    i = 0
    until self[i].nil?
      yield(self[i])
      i += 1
    end
    self
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

  def my_count
    just_counting = block_given?
    if just_counting == false
      i = 1
      i += 1 until self[i].nil?
      return i
    else
      i = 0
      my_each do |x|
        i += 1 if yield x
      end
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
    aux = self[0]
    minus = self[0]
    my_each do |x|
      aux = yield(aux, x)
    end
    aux / minus
  end
end

myarray = [0, 1, 3, 10, 5]

# myarray.each{ |x| puts x }
# myarray.my_each { |x| puts x }

# myarray.each_with_index{|x, i| puts i.to_s+" "+x.to_s}
# myarray.my_each_with_index{|x,i| puts i.to_s+" "+x.to_s}

# print myarray.select(&:even?)
# print myarray.my_select {  |num| num > 2  }

# print myarray.all? {  |num| num >= 2  }
# print myarray.my_all? {  |num| num >= 0  }

# print myarray.any? {  |num| num >= 10 }
# print myarray.my_any? { |num| num == 10 }

# print myarray.none? { |num| num >= 10 }
# print myarray.my_none? { |num| num >= 10 }

# print myarray.my_count(&:even?) #=>
# print myarray.count(&:even?) #=>

# print myarray.my_map{ |i| i*i }
# print myarray.map{ |i| i*i }
# print myarray.inject { |aux, x| aux * x }
# print myarray.my_inject { |aux, x| aux * x }
def multiply_els(array)
  array.my_inject { |aux, x| aux * x }
end
puts multiply_els([2, 4, 5]) #=> 40

my_proc = proc { |i| i + i }
print myarray.my_map(my_proc)
# print myarray.map {|i| i+i}