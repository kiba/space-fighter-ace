#Space Fighter Ace is a space invader clone
#Copyright (C) 2006-2008 Han Dao
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
#
#You can contact the author at wikipediankiba@gmail.com

class Player < SpaceObject
  include Rubygame::EventHandler::HasEventHandler
  IMAGE_PATH = "data/game/player.png"
  def initialize
    super(IMAGE_PATH)
  end
  def act
    super
  end
  def shoot
    @engine.charstrack.addchar(3,@rect.x,@rect.y - 25)
    @engine.charstrack.set_control_last()
    @engine.charstrack.control.state = false
    @engine.charstrack.control.image_set()
  end
  def up
    @rect.y -= 50
  end
  def down
    @rect.y += 50
  end
  def right
    @rect.x += 50
  end
  def left
    @rect.x -= 50
  end
  def hook_move
    hooks = {
      :right => :right ,
      :left => :left ,
      :down => :down ,
      :left => :left ,
      :up => :up
    }
    make_magic_hooks(hooks)
  end
end
