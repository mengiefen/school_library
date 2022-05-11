require './person_decorator'

class CapitalizeDecorator < PersonDecorator
  def correct_name
    @nameable.correct_name.capitalize
  end
end
