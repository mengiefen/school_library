require './person_decorator'

class TrimmerDecorator < PersonDecorator
  def correct_name
    return @nameable.correct_name[0, 9] if @nameable.correct_name.length > 10

    @nameable.correct_name
  end
end
