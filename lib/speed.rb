
class Speed
  attr_reader :speed , :movement
  def initialize object
    super()
    @object = object
    @speed = 0
    @movement = 0.0
    @move = 0
  end
  def move
    @object.location = @object.location.magnitude * @speed
  end
  def set_speed n
    @speed = n
    @movement = @speed / 10.0
  end
  def left
    set_speed(4)
  end
  def right
    set_speed(4)
  end
end
