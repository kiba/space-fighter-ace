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
  include Rubygame::EventHandler::HasEventHandler
  def initialize data
    @data = data
    @engine = GameEngine.new()
    @engine.setmapsurface([800,600])
    @engine.setmapfile("data/maps/blank.map")
    @engine.setimages("data/images.yml")
    @engine.setchar(CharType.new(@engine))
    @engine.setitem(ItemType.new())
    @engine.setadjustforward(400)
    @engine.setadjustbackward(350)
    @engine.setadjustdown(300)
    @engine.setadjustup(250)
    @engine.setfollow("Player")
    @engine.ruleset(GameLaw.new(@engine))
    @player = @engine.following
    @q = Rubygame::EventQueue.new()
    @q.enable_new_style_events()
    @active = false
  end
  def action
    @engine.compute()
    @engine.draw(@data.display.screen)
  end
  def draw
    @data.display.screen.fill([0,0,0])
  end
  def hook_quit
    quit_hooks = {
      :escape => :quit,
      Rubygame::Events::QuitRequested => :quit,
    }
    make_magic_hooks(quit_hooks)
  end
  def quit
    puts "Quiting!"
    Rubygame.quit()
    exit
  end
  def mode
    hook_quit()
    @player.hook_move()
    register(@player)
    loop do
      @engine.prevposition()
      queue_through()
      draw()
      action()
      @data.display.screen.flip()
    end
  end
  def queue_through
    @q.each do |event|
      handle(event)
    end
  end
  def register(*objects)
    objects.each do |object|
      append_hook( :owner => object,
		   :trigger => Rubygame::EventTriggers::YesTrigger.new,
		   :action => Rubygame::EventActions::MethodAction.new(:handle)
		 )
    end
  end
end
