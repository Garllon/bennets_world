module BennetsWorld
  class Ball
    attr_reader :x, :y, :speed

    def initialize(game_window)
      @game_window = game_window
      @icon = Gosu::Image.new(@game_window, './images/asteroid.png', true)

      @x = rand(@game_window.width)
      @y = 0
      @speed = rand(5..10)
    end

    def update
      if y > @game_window.height
        @y = 0
        @x = rand(@game_window.width - @icon.width)
        @speed = rand(5..10)
      else
        @y = y + speed
      end
    end

    def draw
      @icon.draw(x, y, 1)
    end

    def reset!
      @y = 0
      @x = rand(@game_window.width - @icon.width)
    end
  end
end
