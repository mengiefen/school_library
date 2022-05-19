require './person'
require './book'
require './student'
require './teacher'
require './rental'
require 'json'

class IoHandler
  attr_reader :people, :books, :rentals

  def initialize
    @people = []
    @books = []
    @rentals = []
    load_data
  end

  def save_data
    File.write('people.json', JSON.pretty_generate(@people))
    File.write('books.json', JSON.pretty_generate(@books))
    File.write('rentals.json', JSON.pretty_generate(@rentals))
  end

  def load_data
    @people = JSON.parse(File.read('./people.json'), create_additions: true) if File.exist? './people.json'
    @books = JSON.parse(File.read('./books.json'), create_additions: true) if File.exist? './books.json'
    @rentals = JSON.parse(File.read('./rentals.json'), create_additions: true) if File.exist? './rentals.json'
  end

  def add_student(age, name, parent_permission, classroom)
    @people << Student.new(age, name, parent_permission, classroom)
  end

  def add_teacher(age, name, specialization)
    @people << Teacher.new(age, name, specialization)
  end

  def add_book(title, author)
    @books << Book.new(title, author)
  end

  def add_rental(date, person, book)
    @rentals << Rental.new(date, person, book)
  end
end
