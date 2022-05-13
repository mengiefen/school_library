require './nameable'
require './capitalize_decorator'
require './trimmer_decorator'

class Person < Nameable
  attr_reader :id, :rental
  attr_accessor :age, :name, :parent_permission

  def initialize(age, name = 'Unknown', parent_permission: true)
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rental = []
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

  def add_rental(date, book)
    Rental.new(date, self, book)
  end

  def of_age?
    @age >= 18
  end

  private :of_age?
end
