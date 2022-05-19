require './book'
require './person'
class Rental
  attr_accessor :date, :book, :person

  def initialize(date, person, book)
    @date = date

    @book = book
    book.add_rental(self)

    @person = person
    person.add_rental(self)
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      date: @date,
      person: @person,
      book: @book
    }.to_json(*args)
  end

  def self.json_create(data)
    new(data['date'], data['person'], data['book'])
  end
end
