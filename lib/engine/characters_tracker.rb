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


class Characters_Tracker
  attr_accessor :characters , :sprites , :control
  def initialize engine
    @engine = engine
    @chartype = @engine.chartype
    @calculator = MapCalculator.new(@engine.camera.width,@engine.camera.height)
    @characters =  Rubygame::Sprites::Group.new()
    @control = nil
  end
  # NOTE: Generate all characters.
  def datacompute
    @calculator.rectlocation(@engine.mapfiles.characters) {
      addchar(@calculator.o,@calculator.x,@calculator.y)
    }
  end
  # NOTE: Collect positions to revert back to.
  def prevposition
    @characters.each do |c|
      c.retainer = [c.rect.x,c.rect.y]
    end
  end
  # NOTE: Compute actions.
  def act
    n = 0
    @characters.each do |c|
      if c.death == true
        @characters.delete(c)
      else
        c.act()
      end
      n += 1
    end
  end
  # NOTE: Look up a specific character.
  def lookup name , obj = false
    n = 0
    @characters.each do |char|
      if char.name == name
        if obj == true
          return char
        else
          return n
        end
      end
      n += 1
    end
  end
  # NOTE: Print all the characters' name.
  def printall
    name = []
    @characters.each do |char|
      puts char.name
      name << char
    end
    return name
  end
  # NOTE: Clear out the characters and sprites array.
  def clean
    @characters = Rubygame::Sprites::Group.new()
  end
  # NOTE: Add a character to the mix.
  def addchar o , x , y
    char = @chartype.options(o,x,y)
    if char != false
      @characters << char
    end
  end
  # NOTE: Set the @control to last
  def set_control_last
    @control = @characters.last
  end
  # NOTE: Set the @control at specific value in @characters array.
  def set_control_at n
    @control = @characters[n]
  end
  def move_all_characters x , y
    @characters.each do |character|
      character.add_to_rect(x,y)
    end
  end
  def draw screen
    @characters.draw(screen)
  end
end
