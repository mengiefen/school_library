#!/usr/bin/env ruby
require './app'
class Main
  def initialize
    @app = App.new
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
    if operation == 'q'
      @app.save_all
      puts 'Thank you for using school library app!!'.upcase
      exit
    end
    choose_option(operation)
  end

  def choose_option(operation)
    case operation
    when '1'
      @app.list_all_books
    when '2'
      @app.list_all_people
    when '3'
      @app.create_person
    when '4'
      @app.create_book
    when '5'
      @app.create_rental
    when '6'
      @app.list_all_rentals
    end
    print_options
  end

  def run
    print_options
    choose_option(option)
  end
end

Main.new.run
