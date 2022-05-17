require './book'
require 'json'

class BooksOption
  attr_reader :books

  def initialize
    @books = []
    load_data
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

  def load_data
    data = JSON.parse File.read './book.json' if  File.exist? './book.json'
    data.each do |book|
      @books.push(Book.from_json(book))
    end
  end

  def save_data
    book_json = "[#{@books.map(&:to_json).join(',')}]"
    File.write('book.json', book_json)
  end
end
