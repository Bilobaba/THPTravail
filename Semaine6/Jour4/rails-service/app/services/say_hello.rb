class SayHello

  def initialize(a = "a",b = "b")
    @msg = a + b
  end
  def perform(msg)
    p @msg = msg
  end
end
