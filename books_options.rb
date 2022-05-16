require './book'

class BooksOption
  attr_reader :books

  def initialize
    @books = []
  end

  # List all books
  def list_all_books
    @books.each_with_index do |book, index|
      puts "#{index + 1})  Title: #{book.title}, Author: #{book.author}"
    end
  end

  # Create a book.
  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @books << Book.new(title, author)
    puts 'Book created successfully!'
  end
end
