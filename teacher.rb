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

  # def to_json(*args)
  #   {
  #     JSON.create_id => self.class.name,
  #     id: @id,
  #     age: @age,
  #     name: @name,
  #     specialization: @specialization
  #   }.to_json(*args)
  # end

  # def self.json_create(data)
  #   new(data['id'], data['name'], data['specialization'])
  # end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      id: @id,
      age: @age,
      name: @name,
      specialization: @specialization
    }.to_json(*args)
  end

  def self.json_create(object)
    # age, name, specialization = object
    new(object['age'], object['name'], object['specialization'])
  end
end
