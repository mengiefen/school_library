require './nameable'
require './capitalize_decorator'
require './trimmer_decorator'
require './rental'

class Person < Nameable
  attr_reader :id, :rentals
  attr_accessor :age, :name, :parent_permission

  def initialize(age, name = 'Unknown', id = nil, parent_permission: true)
    @id = id || Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
    super()
  end

  def can_use_services?
    if of_age? || @parent_permission
      true
    else
      false
    end
  end

  def correct_name
    return @name if @name.match?(/^[a-zA-Z]+$/i)

    @nameable.correct_name
  end

  def add_rental(rental)
    @rentals.push(rental)
  end

  def of_age?
    @age >= 18
  end
  private :of_age?
end
