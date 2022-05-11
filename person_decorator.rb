require './nameable'

class PersonDecorator < Nameable
  attr_accessor :nameable

  def initialize(nameable)
    @nameable = nameable
    super()
  end

  def correct_name
    @nameable
  end
end
