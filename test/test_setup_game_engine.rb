
class Test_Setup_Game_Engine < Test::Unit::TestCase
  def setup
    @game = GameEngine.new()
  end
  def test_inital
    assert @game.mapfiles.name == nil
    assert @game.mapengine == nil
  end
  def test_setup_mapfiles
    @game.setmapfile("data/maps/blank.map")
    assert @game.mapfiles.name == "data/maps/blank.map"
    assert @game.mapengine.class == MapEngine
  end
  def test_setup_images
    @game.setmapfile("data/maps/blank.map")
    assert @game.mapengine.terrian[0].name == "data/placeholder.png"
    @game.setimages("data/images.yml")
    assert @game.mapengine.terrian[0].name == "data/nebula1.png"
  end
end
