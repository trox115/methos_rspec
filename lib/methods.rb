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