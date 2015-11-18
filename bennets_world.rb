LIB_PATH = File.dirname(__FILE__)
$LOAD_PATH.unshift LIB_PATH

require 'gosu'
require 'bennets_world/window'
require 'bennets_world/player'
require 'bennets_world/ball'
require 'bennets_world/background'

module BennetsWorld
  VERSION = '0.1.0'
end

window = BennetsWorld::Window.new
window.show
