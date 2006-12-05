#Copyright (C) 2006 by Han Dao

# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
#
#You can contract the author at wikipediankiba@gmail.com

#Experimental application for game world.

require 'rubygame'
require 'RbGooey'
require 'yaml'
require "lib/game.rb"
require "lib/fighter.rb"
require "lib/starter.rb"
include Rubygame
TTF.setup
Starter.new