#!/usr/bin/env ruby

require './person'
require './rental'
require './book'
require './student'
require './teacher'
require './classroom'

class App
  attr_reader :people, :books, :rentals

  def initialize
    @people = []
    @books = []
    @rentals = []
  end

  def choose_option(operation)
    case operation
    when '1'
      list_all_books
    when '2'
      list_all_people
    when '3'
      create_person
    when '4'
      create_book
    when '5'
      create_rental
    when '6'
      list_all_rentals
    end
    print_options
  end
  # else
  # puts 'Please enter valid input from the options provided'

  def print_options
    puts ''
    puts 'WELCOME TO SCHOOL LIBRARY APP!'
    puts ''
    puts 'Please choose an operation from the following options'
    puts '1  →  List all books'
    puts '2  →  List all people'
    puts '3  →  Create a person'
    puts '4  →  Create a book'
    puts '5  →  Create a rental'
    puts '6  →  List all rentals for a given person id'
    puts 'q  →  Quit'
    operation = gets.chomp
    exit if operation == 'q'

    choose_option(operation)
  end

  # List all books
  def list_all_books
    @books.each_with_index do |book, index|
      puts "#{index + 1})  Title: #{book.title}, Author: #{book.author}"
    end
  end

  # List all people.
  def list_all_people
    @people.each_with_index do |person, index|
      puts "#{index + 1})  [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
  end

  # Create a person (teacher or student, not a plain Person).
  def create_student
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Has parent permission? [Y/N]: '
    parent_permission = true && gets.chomp.downcase == 'y'
    print 'Classroom: '
    classroom = gets.chomp
    person = Student.new(age, name, parent_permission, classroom)
    puts 'Person created successfuly'
    person
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    person = Teacher.new(age, name, specialization)
    puts 'Person created successfuly'
    person
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2) [enter the number]: '
    person_role = gets.chomp
    case person_role
    when '1'
      @people << create_student
    when '2'
      @people << create_teacher
    else
      puts 'Please enter valid input'
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

  # Create a rental.
  def create_rental
    puts 'Select a book from the following list by serial number'
    puts ''
    list_all_books
    selected_book = @books[gets.chomp.to_i - 1]
    puts 'Select a person from the following list by serial number'
    puts ''
    list_all_people
    selected_person = @people[gets.chomp.to_i - 1]
    print 'Date: '
    date = gets.chomp
    @rentals << selected_person.add_rental(date, selected_book)
  end

  # List all rentals by ID
  def list_all_rentals
    print 'ID of person: '
    id = gets.chomp.to_i
    person_details = @people.find { |person| person.id == id }
    if person_details
      puts 'Rentals'
      person_details.rental.each_with_index do |rental, index|
        puts "#{index + 1}) #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
      end
    else
      puts 'No rentals to show'
    end
  end

  def run
    option = print_options
    choose_option(option)
  end
end

###################################################

def main
  app = App.new
  app.run
end

main
