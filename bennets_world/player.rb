module BennetsWorld
  class Player
    attr_reader :window, :icon, :x, :y

    def initialize(window)
      @window = window
      @icon = Gosu::Image.new(window, './images/player1.png', true)

      @x = 50
      @y = 450
    end

    def draw
      icon.draw(x, y, 1)
    end

    def move_left
      return @x = 0 if x < 0
      @x -= 10
    end

    def move_right
      return @x = rightmost_position if x > rightmost_position
      @x += 10
    end

    def move_up
      return @y = 0 if @y < 0
      @y -= 10
    end

    def move_down
      return @y = lowest_position if y > lowest_position
      @y += 10
    end

    def hit_by?(balls)
      balls.any? { |ball| Gosu::distance(x, y, ball.x, ball.y) < 50 }
    end

    private

    def rightmost_position
      window.width - icon.width
    end

    def lowest_position
      window.height - icon.height 
    end
  end
end
