
class Speed < Regulator
  attr_reader :speed , :movement , :position
  def initialize player
    @player = player
    @speed = 0
    @movement = 0
    @position = 0.0
    @addup = 0.0
    @predicted_position = 0
  end
  def setup
    set_action_for_zero {
      @predicted_position = @player.rect.x + speed
    }
    set_action_for_final {
      @player.rect.x = @predicted_position
      @time = 0

    }
    set_do_in_between {
      @addup += @movement
      @times += 1
    }
  end
  def move
    tick()
  end
  def set_speed n
    @speed = n
    @movement = @speed / 10.0
  end
end
