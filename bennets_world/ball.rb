module BennetsWorld
  class Ball
    def initialize(game_window)
      @game_window = game_window
      @icon = Gosu::Image.new(@game_window, './images/asteroid.png', true)

      @x = rand(@game_window.width)
      @y = 0
    end

    def update
      if @y > @game_window.height
        @y = 0
        @x = rand(@game_window.width - @icon.width)
      else
        @y = @y + 10
      end
    end

    def draw
      @icon.draw(@x, @y, 1)
    end

    def x
      @x
    end

    def y
      @y
    end

    def reset!
      @y = 0
      @x = rand(@game_window.width - @icon.width)
    end
  end
end
