require './person'

class Student < Person
  attr_reader :classroom

  def initialize(age, name, parent_permission, classroom, id = nil)
    super(age, name, id, parent_permission: parent_permission)

    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end

  # def to_json(*args)
  #   {
  #     JSON.create_id => self.class.name,
  #     id: @id,
  #     age: @age,
  #     name: @name,
  #     parent_permission: @parent_permission,
  #     classroom: @classroom,
  #     rentals: @rentals
  #   }.to_json(*args)
  # end

  # def self.json_create(data)
  #   new(data['id'], data['name'], data['parent_permission'], data['classroom'])
  # end
  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      id: @id,
      age: @age,
      name: @name,
      parent_permission: @parent_permission,
      classroom: @classroom
    }.to_json(*args)
  end

  def self.json_create(object)
    Student.new(object['age'], object['name'], object['parent_permission'], object['classroom'], object['id'])
  end
end
