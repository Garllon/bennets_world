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
      @x = @x - 10
    end

    def move_right
      @x = @x + 10
    end

    def move_up
      @y = @y - 10
    end

    def move_down
      @y = @y + 10
    end
  end
end
