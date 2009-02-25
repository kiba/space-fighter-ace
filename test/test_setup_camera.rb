
class Test_Map_Camera < Test::Unit::TestCase
  def setup
    @game = GameEngine.new()
  end
  def test_initial
    assert @game.camera.class == Camera
    test = @game.compute()
    assert test == false
  end
  def test_setup_following_and_still_fail
    @game.setchar(CharType.new(@game))
    @game.setfollow("Player")
    test = @game.compute()
    assert @game.camera.following.class == Player
    assert test == false
  end
  def test_which_is_computable?
    assert @game.camera.characters == nil
    @game.setchar(CharType.new(@game))
    assert @game.camera.characters.class == Characters_Tracker
  end
end
