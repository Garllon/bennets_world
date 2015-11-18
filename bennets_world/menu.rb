module BennetsWorld
  class Menu
    attr_reader :window, :menu_font
    attr_accessor :selection

    def initialize(window)
      @window = window

      @title_start = 'Start Game'
      @title_end = 'End Game'
      @selection = 1
      @menu_font = Gosu::Font.new(window, "Tahoma", window.height / 12)
    end

    def draw
      hcolor = 0xffffd700
      scolor = 0xffc0c0c0

      @selection == 1 ? scolor = hcolor : scolor = 0xffc0c0c0
      @menu_font.draw(@title_start, text_center(@title_start), 355, 3, 1, 1, scolor)
      @selection == 2 ? scolor = hcolor : scolor = 0xffc0c0c0
      @menu_font.draw(@title_end, text_center(@title_end), 455, 3, 1, 1, scolor)
    end

    private

    def text_center(text)
      ((window.width - menu_font.text_width(text)) / 2)
    end
  end
end
