LIB_PATH = File.dirname(__FILE__)
$LOAD_PATH.unshift LIB_PATH

require 'gosu'
require 'bennets_world/window'
require 'bennets_world/player'
require 'bennets_world/ball'

module BennetsWorld
end

window = BennetsWorld::Window.new
window.show
