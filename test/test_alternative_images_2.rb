class Test_Alternative_Images_2 < Test::Unit::TestCase
  def setup
    @mapfiles = MapFiles.new()
    @mapfiles.read("data/maps/blank.map")
    files = FileSys.new()
    @images = files.yaml_read("test/images2.yml")
    @editmap = EditMap.new(@mapfiles,@images)
  end
  def test_initial
    @editmap.change()
    @editmap.edit()
    assert @mapfiles.map[0] == 1
  end
  def test_end_of_list
    change(6)
    @editmap.edit()
    assert @mapfiles.map[0] == 0
    assert @mapfiles.characters[0] == 0
    assert @mapfiles.items[0] == 3
  end
  def change num
    num.times do
      @editmap.change()
    end
  end
end
