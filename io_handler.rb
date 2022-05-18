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
 end

 def save_data
  File.write('people.json',JSON.pretty_generate(@people)) if @people.length != 0
  File.write('books.json',JSON.pretty_generate(@books)) if @books.length != 0
  File.write('rentals.json',JSON.pretty_generate(@rentals)) if @rentals.length != 0
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