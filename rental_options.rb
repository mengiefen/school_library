require './rental'
require './books_options'
require './people_options'

class RentalOption
  attr_reader :rentals

  def initialize
    @rentals = []
    load_rental
  end

  # Create a rental.
  def create_rental(books, people)
    puts 'Select a book from the following list by serial number'
    puts ''
    books.each_with_index do |book, index|
      puts "#{index + 1})  Title: #{book.title}, Author: #{book.author}"
    end
    selected_book = books[gets.chomp.to_i - 1]
    puts 'Select a person from the following list by serial number'
    puts ''
    people.each_with_index do |person, index|
      puts "#{index + 1})  [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    selected_person = people[gets.chomp.to_i - 1]
    print 'Date: '
    date = gets.chomp
    @rentals << selected_person.add_rental(date, selected_book)
    save_rental
    puts 'Rental Created successfully'
  end

  # List all rentals by ID
  def list_all_rentals(people)
    print 'ID of person: '
    id = gets.chomp.to_i
    person_details = people.find { |person| person.id == id }
    if person_details
      puts 'Rentals'
      person_details.rental.each_with_index do |rental, index|
        puts "#{index + 1}) #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
      end
    else
      puts 'No rentals to show'
    end
  end

  def save_rental
    rental_json = "[#{@rentals.map(&:to_json).join(',')}]"
    File.write('rental.json', rental_json)
  end

  def load_rental
    data = JSON.parse File.read './rental.json' if File.exist? './rental.json'
    puts data
    data.each do |rental|
      @rentals.push(Rental.from_json(rental))
    end
  end
end
