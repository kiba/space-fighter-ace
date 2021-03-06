#YourGameHere
#Copyright (C) 2008 YourNameHere

#Kiba Role Playing Game Engine(KRPGE)
#Copyright (C) 2008 Han Dao and contributors
#
#This program is free software: you can redistribute it and/or modify
#it under the terms of the GNU General Public License as published by
#the Free Software Foundation, either version 3 of the License, or
#(at your option) any later version.
#
#This program is distributed in the hope that it will be useful,
#but WITHOUT ANY WARRANTY; without even the implied warranty of
#MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#GNU General Public License for more details.
#
#You should have received a copy of the GNU General Public License
#along with this program.  If not, see <http://www.gnu.org/licenses/>.

#You can contact the author at wikipediankiba@gmail.com

class EngineInfo
  attr_accessor :images, :following, :chartype, :mapfiles, :itemtype , :surface , :mapengine, :itemstracker, :mapsurface , :characters_tracker , :camera
  def initialize
    @file = FileSys.new()
    @mapfiles = MapFiles.new()
    @camera = Camera.new()
  end
  def set
    @camera.set(self)
  end
  # NOTE: MapEngine's Camera object will follow this object.
  def setfollow follow
    @following = follow
    if @following.class == String
      @following = @characters_tracker.lookup(@following,true)
    end
    set()
  end
  # NOTE: Load images.
  def setimages name
    @images = @file.yaml_read(name)
    if @mapengine.class == MapEngine
      @mapengine.mapimages.load_all_images(@images)
    end
  end
  # NOTE: Set mapfile
  def setmapfile name
    @mapfiles.read(name)
    @mapengine = MapEngine.new(self)
    @mapengine.setup()
    if @images != nil
      @mapengine.mapimages.load_all_images(@images)
    end
    if @characters_tracker != nil
      @characters_tracker.datacompute()
    end
    set()
  end
  # NOTE: Set the class for choosing character types.
  def setchar char
    @chartype = char
    @characters_tracker = Characters_Tracker.new(self)
    @characters_tracker.datacompute()
    set()
  end
  # NOTE: Set the class for choosing item types.
  def setitem item
    @itemtype = item
    @itemstracker = ItemsTracker.new(self)
    set()
  end
  # NOTE: Set the mapsurface size
  def setmapsurface size
    @mapsurface = Surface.new(size)
  end
  def setadjustforward n
    @camera.adjustforward = n
  end
  def setadjustbackward n
    @camera.adjustbackward = n
  end
  def setadjustup n
    @camera.adjustup = n
  end
  def setadjustdown n
    @camera.adjustdown = n
  end
end
