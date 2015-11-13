module BennetsWorld
  class Window < Gosu::Window
    def initialize
      super(700, 700, false)
      self.caption = 'Bennets Game'

      @player1 = Player.new(self) 
      @ball = Ball.new(self)
    end
    
    def update
      case which_button
      when 'left' then @player1.move_left
      when 'right' then @player1.move_right
      when 'up' then @player1.move_up
      when 'down' then @player1.move_down
      end

      @ball.update
    end

    def draw
      @player1.draw
      @ball.draw
    end

    private

    def which_button
      return 'left' if button_down? Gosu::Button::KbLeft 
      return 'right' if button_down? Gosu::Button::KbRight
      return 'up' if button_down? Gosu::Button::KbUp
      return 'down' if button_down? Gosu::Button::KbDown
    end
  end
end
