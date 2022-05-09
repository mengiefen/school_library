require './person'

class Student < Person
  attr_reader :classroom

  def initialize(name, age, parent_permission, classroom)
    super(name, parent_permission, age)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
