#!/usr/bin/env ruby
require './books_options'
require './rental_options'
require './people_options'

class Main
  def initialize
    @book = BooksOption.new
    @rental = RentalOption.new
    @people = PeopleOptions.new
  end

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

  def choose_option(operation)
    case operation
    when '1'
      @book.list_all_books
    when '2'
      @people.list_all_people
    when '3'
      @people.create_person
    when '4'
      @book.create_book
      @book.save_data
    when '5'
      @rental.create_rental(@book.books, @people.people)
    when '6'
      @rental.list_all_rentals(@people.people)
    end
    print_options
  end

  def run
    print_options
    choose_option(option)
  end
end

Main.new.run

