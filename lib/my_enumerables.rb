module Enumerable
  # Your code goes here
  # if executes a code when condition is true
  # unless executes code when condition is false
  def my_all?
    self.each do |element|
      return false unless yield(element)
    end
    return true
  end

  def my_any?
    self.each do |element|
      return true if yield(element)
    end
    false
  end

  def my_count
    i = 0
    if block_given?
      self.each do |element|
        if yield(element)
          i += 1
        end
      end
    else 
      i = size
    end
    return i
  end

  def my_none?
    self.each do |element|
      return false if yield(element)
    end
    true
  end

  def my_select
    new_arr = []
    self.each do |element|
      if yield(element)
        new_arr << element
      end
    end
    return new_arr
  end

  def my_map(&block)
    new_arr = []
    self.each do |element|
      new_arr << block.call(element)
    end
    new_arr
  end

  def my_each_with_index
    index = -1
    self.each do |element|
      index += 1
      yield(element, index)
    end
    self
  end

  def my_inject(initial_value)
    results = initial_value
    self.each do |element|
      results = yield(results, element)
    end
    results
  end
end

# You will first have to define my_each
# on the Array class. Methods defined in
# your enumerable module will have access
# to this method
class Array
  # Define my_each here
  def my_each
    self.each do |element|
      yield(element)
    end 
  end
end
