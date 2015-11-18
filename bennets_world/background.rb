module BennetsWorld
  class Background
    def initialize(window, x, y)
      @window = window
      @x = x
      @y = y
    end

    def draw(image)
      image.draw(@x, @y, 0)
    end
  end
end
