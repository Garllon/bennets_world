module BennetsWorld
  class Window < Gosu::Window
    SCREEN_HEIGHT = 700
    SCREEN_WIDTH = 700

    def initialize
      super(SCREEN_HEIGHT, SCREEN_WIDTH, false)
      self.caption = 'Bennets Game'

      @player           = Player.new(self)
      @balls            = 3.times.map { Ball.new(self) }
      @background_image = Gosu::Image.new(self, './images/background.png', true)
      @menu             = Menu.new(self)
      @theme            = Gosu::Song.new(self, 'music/theme.ogg')
      @running          = false
      @offset           = 0
    end

    def update
      @theme.play

      if @running
        handle_buttons
        @balls.each { |ball| ball.update }

        stop_game!  if @player.hit_by?(@balls)
      else
        menu_action = @menu.update
        if menu_action == "start"
          @running = true
        elsif menu_action == 'end'
          close
        end
      end
    end

    def draw
      draw_background
      if @running
        @player.draw
        @balls.each { |ball| ball.draw }
      else
        @menu.draw
      end
    end

    def restart_game
      @running = true
      @balls.each { |ball| ball.reset! }
    end

    def button_down(id)
      @menu.button_down(id)
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
      @balls.each { |ball| ball.reset! }
      @menu.menu_action = nil
    end

    def handle_buttons
      case which_button
      when 'left' then @player.move_left
      when 'right' then @player.move_right
      when 'up' then @player.move_up
      when 'down' then @player.move_down
      when 'escape' then @running = false && @menu.menu_action = nil
      end
    end

    def which_button
      return 'left' if button_down? Gosu::Button::KbLeft 
      return 'right' if button_down? Gosu::Button::KbRight
      return 'up' if button_down? Gosu::Button::KbUp
      return 'down' if button_down? Gosu::Button::KbDown
      return 'escape' if button_down? Gosu::Button::KbEscape
    end
  end
end
