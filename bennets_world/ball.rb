module BennetsWorld
  class Ball
    attr_reader :x, :y, :speed, :window, :icon

    def initialize(game_window)
      @window = game_window
      @icon = Gosu::Image.new(window, './images/asteroid.png', true)
      @x = rand(window.width)
      @y = 0
      @speed = rand(5..10)
    end

    def update
      reset!  if y > window.height
      @y = y + speed
    end

    def draw
      icon.draw(x, y, 1)
    end

    def reset!
      @y = 0
      @x = rand(window.width - icon.width)
      @speed = rand(5..10)
    end
  end
end
