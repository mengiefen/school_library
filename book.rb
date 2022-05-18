require './rental'
class Book
  attr_accessor :title, :author
  attr_reader :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def add_rental(rental)
    @rentals.push(rental)
  end

  # def add_rental(date, person)
  #   Rental.new(date, person, self)
  # end

  # def to_json(*args)
  #   {
  #     JSON.create_id => self.class.name,
  #     title: @title,
  #     author: @author
  #   }.to_json(*args)
  # end

  # def self.json_create(data)
  #   new(data['title'], data['author'])
  # end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'data' => [@title, @author]
    }.to_json(*args)
  end

  def self.json_create(object)
    title, author = object['data']
    new(title, author)
  end
end
