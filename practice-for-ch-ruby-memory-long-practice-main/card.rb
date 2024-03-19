class Card
  def initialize(face_value)
    @face_value = face_value
    @side_up = false
  end

  attr_reader :face_value, :side_up

  def hide
    @side_up = false
  end

  def reveal
    @side_up = true
  end

  def to_s
    @face_value.to_s
  end

  def ==(card_1)
    @face_value == card_1
  end

end
