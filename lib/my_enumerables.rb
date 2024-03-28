module Enumerable
  # Your code goes here
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
