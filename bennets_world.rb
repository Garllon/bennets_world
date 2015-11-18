LIB_PATH = File.dirname(__FILE__)
$LOAD_PATH.unshift LIB_PATH

require 'gosu'
require 'bennets_world/window'
require 'bennets_world/player'
require 'bennets_world/ball'
require 'bennets_world/background'
require 'bennets_world/menu'

module BennetsWorld
  VERSION = '0.2.0-3'
end

window = BennetsWorld::Window.new
window.show
