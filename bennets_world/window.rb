module BennetsWorld
  class Window < Gosu::Window
    def initialize
      super(700, 700, false)
      self.caption = 'Bennets Game'

      @player1          = Player.new(self)
      @balls            = 3.times.map { Ball.new(self) }
      @background_image = Gosu::Image.new(self, './images/background.png', true)
      @running          = true
      @offset           = 0
    end

    def update
      if @running
        case which_button
        when 'left' then @player1.move_left
        when 'right' then @player1.move_right
        when 'up' then @player1.move_up
        when 'down' then @player1.move_down
        end

        @balls.each { |ball| ball.update }

        if @player1.hit_by?(@balls)
          stop_game!
        end
      else
        if button_down? Gosu::Button::KbEscape
          restart_game
        end
      end
    end

    def draw
      draw_background
      @player1.draw
      @balls.each { |ball| ball.draw }
    end

    private

    def draw_background
      @offset = @offset + 1
      @offset = 0 if @offset == 300

      [0, 300, 600].each do |x|
        [-300, 0, 300, 600].each do |y|
          background = Background.new(self, x, y + @offset)
          background.draw(@background_image)
        end
      end
    end

    def stop_game!
      @running = false
    end

    def restart_game
      @running = true
      @balls.each { |ball| ball.reset! }
    end

    def which_button
      return 'left' if button_down? Gosu::Button::KbLeft 
      return 'right' if button_down? Gosu::Button::KbRight
      return 'up' if button_down? Gosu::Button::KbUp
      return 'down' if button_down? Gosu::Button::KbDown
    end
  end
end
