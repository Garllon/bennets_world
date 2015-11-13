module BennetsWorld
  class Ball
    def initialize(game_window)
      @game_window = game_window
      @icon = Gosu::Image.new(@game_window, './images/asteroid.png', true)

      @x = rand(@game_window.width)
      @y = 0
    end

    def update
      @y = @y + 10
    end

    def draw
      @icon.draw(@x, @y, 1)
    end
  end
end
