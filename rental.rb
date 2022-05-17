class Rental
  attr_accessor :date, :book, :person

  def initialize(date, person, book)
    @date = date

    @book = book
    book.rental << self

    @person = person
    person.rental << self
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      date: @id,
      book: @book,
      person: @person
    }.to_json(*args)
  end

  # def to_json(*_args)
  #   JSON.dump({
  #               date: @date,
  #               book: {
  #                 title: @book.title,
  #                 author: @book.author
  #               },
  #               person: {
  #                 id: @person.id,
  #                 name: @person.name,
  #                 age: @person.age
  #               }
  #             })
  # end

  def self.from_json(data)
    new(data['date'], data['book'], data['person'])
  end
end
