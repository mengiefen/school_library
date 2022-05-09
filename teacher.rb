require './person'

class Teacher < Person
  attr_reader :specialization

  def initialize(name, age, specialization)
    super(name, parent_permission = true, age)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
