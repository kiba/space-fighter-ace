
class Test_Setup_Game_Engine < Test::Unit::TestCase
  def setup
    @game = GameEngine.new()
  end
  def test_inital
    assert @game.mapfiles.name == nil
    assert @game.mapengine == nil
    assert @game.images == nil
  end
  def test_setup_mapfiles
    @game.setmapfile("test/blank.map")
    assert @game.mapfiles.name == "test/blank.map"
    assert @game.mapengine.class == MapEngine
    assert @game.mapengine.terrain[0].identifer == 0
    assert @game.mapengine.terrain[1].identifer == 1
    assert @game.mapengine.mapobj[0].identifer == 0
    assert @game.mapengine.mapobj[1].identifer == 1
    assert @game.mapengine.mapobj[2].identifer == 2
    assert @game.mapengine.mapobj[2].name = "data/blank.png"
    assert @game.mapengine.terrain[1].name = "data/placeholder.png"
  end
  def test_setup_images
    @game.setmapfile("test/blank.map")
    assert @game.mapengine.terrain[0].name == "data/placeholder.png"
    assert @game.mapengine.mapobj[1].name == "data/blank.png"
    @game.setimages("test/images.yml")
    load_images?
  end
  # NOTE: See if they got the proper names for image loading.
  def load_images?
    assert @game.mapengine.terrain[0].name = "data/nebula1.png"
    assert @game.mapengine.mapobj[1].name == "data/wall1.png"
  end
  # NOTE: Test the opposite direction
  def test_setup_images_before_mapfiles
    @game.setimages("test/images.yml")
    @game.setmapfile("test/blank.map")
    load_images?
  end
  def test_setup_characters
    assert @game.characters_tracker == nil
    assert @game.chartype == nil
    @game.setchar(CharType.new(@game))
    assert @game.characters_tracker.class == Characters_Tracker
  end
  def test_compute_characters_with_mapfiles
    @game.setchar(CharType.new(@game))
    @game.setmapfile("test/player.map")
    did_it_work_with_characters?
  end
  def did_it_work_with_characters?
    assert @game.characters_tracker.characters[0].class == Player
    assert @game.characters_tracker.characters[0].rect.x = 60
    assert @game.characters_tracker.characters[0].rect.y = 0
  end
  def test_mapfiles_before_characters_tracker
    @game.setmapfile("test/player.map")
    @game.setchar(CharType.new(@game))
    did_it_work_with_characters?
  end
  def test_will_go_false_without_chartype
    @game.setmapfile("test/player.map")
    assert @game.characters_tracker == nil
  end
end
