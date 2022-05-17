class Book
  attr_accessor :title, :author
  attr_reader :rental

  def initialize(title, author)
    @title = title
    @author = author
    @rental = []
  end

  def add_rental(date, person)
    Rental.new(date, person, self)
  end

  def to_json(*args)
    {
      JSON.create_id => self.class.name,
      'title' => @title,
      'author' => @author,
      'rentals' => @rentals
    }.to_json(*args)
  end

  # def to_json(*_args)
  #   JSON.dump({
  #               title: @title,
  #               author: @author
  #             })
  # end

  def self.from_json(data)
    new(data['title'], data['author'])
    @rentals = data['rentals']
  end
end
