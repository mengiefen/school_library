require './person'

class Student < Person
  attr_reader :classroom

  def initialize(age, name, parent_permission, classroom)
    super(age, name, parent_permission: parent_permission)

    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  def to_json(*_args)
    JSON.dump({
                id: @id,
                name: @name,
                parent_permission: @parent_permission,
                classroom: @classroom,
              })
  end

  def self.from_json(data)
    new(data['id'], data['name'], data['parent_permission'], data['classroom'])
  end
end
