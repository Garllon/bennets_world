module BennetsWorld
  class Window < Gosu::Window
    def initialize
      super(700, 700, false)
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
        case which_button
        when 'left' then @player.move_left
        when 'right' then @player.move_right
        when 'up' then @player.move_up
        when 'down' then @player.move_down
        when 'escape' then @running = false
        end

        @balls.each { |ball| ball.update }

        stop_game!  if @player.hit_by?(@balls)
      else
        toggle_menu
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

    private

    def toggle_menu
      if button_down? Gosu::Button::KbUp
        @menu.selection -= 1
        if @menu.selection < 1
          @menu.selection = 2
        end
      elsif button_down? Gosu::Button::KbDown
        @menu.selection += 1
        if @menu.selection > 2
          @menu.selection = 1
        end
      elsif button_down? Gosu::KbReturn
        restart_game if @menu.selection == 1
      end
    end

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
      return 'escape' if button_down? Gosu::Button::KbEscape
    end
  end
end
