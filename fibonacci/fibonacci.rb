class Fibonacci
  attr_accessor :current, :last

  def initialize
    @current = 0
    @last = 1
  end

  def find(number)
    while number > 0
      old = self.current
      self.current = self.current + self.last
      self.last = old
      number -= 1
    end
    current
  end
end
