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

  def to_json(*_args)
    JSON.dump({
                id: @id,
                name: @name,
                specialization: @specialization
              })
  end

  def self.from_json(data)
    new(data['id'], data['name'], data['specialization'])
  end
end
