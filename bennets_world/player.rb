module BennetsWorld
  class Player
    def initialize(game_window)
      @game_window = game_window
      @icon = Gosu::Image.new(@game_window, './images/player1.png', true)

      @x = 50
      @y = 50
    end

    def draw
      @icon.draw(@x, @y, 1)
    end

    def move_left
      if @x < 0
        @x = 0
      else
        @x = @x - 10
      end
    end

    def move_right
      if @x > (@game_window.width - @icon.width)
        @x = @game_window.width - @icon.width
      else
        @x = @x + 10
      end
    end

    def move_up
      if @y < 0
        @y = 0
      else
        @y = @y - 10
      end
    end

    def move_down
      if @y > (@game_window.height - @icon.height)
        @y = @game_window.height - @icon.height
      else
        @y = @y + 10
      end
    end
  end
end
