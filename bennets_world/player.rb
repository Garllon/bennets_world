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
      if @x > 500
        @x = 500
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
      if @y > 500
        @y = 500
      else
        @y = @y + 10
      end
    end
  end
end
