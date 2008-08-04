#YourGameHere
#Copyright (C) 2008 YourNameHerea

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

class Controller
  def initialize data
    @data = data
    @engine = GameEngine.new()
    @engine.setmapsurface([800,600])
    @engine.setmapfile("data/maps/blank.map")
    @engine.setimages("data/images.yml")
    @engine.setchar(CharType.new(@engine))
    @engine.setitem(ItemType.new())
    @engine.setfollow("Example")
    @engine.setup()
    @engine.ruleset(GameLaw.new(@engine))
    @q = Rubygame::EventQueue.new()
  end
  def action
    @engine.compute()
    @engine.draw(@data.display.screen)
  end
  def mode
    loop do
      @engine.prevposition()
	    @q.each do |ev|
        case ev
        when Rubygame::QuitEvent
          Rubygame.quit()
          exit
        when Rubygame::KeyDownEvent
          case ev.key
          when Rubygame::K_ESCAPE
            Rubygame.quit()
            exit
          end
		    end
      end
      action()
      @data.display.screen.flip()
    end
  end
end
