require './person'

class Teacher < Person
  attr_reader :specialization

  def initialize(age, name, specialization)
    super(age, name)
    @specialization = specialization
  end

  def can_use_services?
    true
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      id: @id,
      age: @age,
      name: @name,
      parent_permission: @parent_permission,
      specialization: @specialization
    }.to_json(*args)
  end

  # def to_json(*_args)
  #   JSON.dump({
  #               classname: self.class,
  #               id: @id,
  #               name: @name,
  #               specialization: @specialization
  #             })
  # end

  def self.from_json(data)
    new(data['id'], data['name'], data['specialization'])
  end
end
