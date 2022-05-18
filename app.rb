require './book'
require './student'
require './teacher'
require './rental'
require './io_handler'

class App
  attr_reader :books, :people, :rentals

  def initialize
    @books = []
    @people = []
    @rentals = []
    @IO = IoHandler.new
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
    @books << @IO.add_book(title, author)
    @IO.save_data
    puts 'Book created successfully!'
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
    person = @IO.add_student(age, name, parent_permission, classroom)
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
    person = @IO.add_teacher(age, name, specialization)
    puts 'Person created successfuly'
    person
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2) [enter the number]: '
    person_role = gets.chomp
    case person_role
    when '1'
      @people << create_student
      @IO.save_data
    when '2'
      @people << create_teacher
      @IO.save_data
    else
      puts 'Please enter valid input'
    end
  end

  # Create a rental.
  def create_rental
    puts 'Select a book from the following list by serial number'
    puts ''
    @books.each_with_index do |book, index|
      puts "#{index + 1})  Title: #{book.title}, Author: #{book.author}"
    end
    selected_book = @books[gets.chomp.to_i - 1]
    puts 'Select a person from the following list by serial number'
    puts ''
    @people.each_with_index do |person, index|
      puts "#{index + 1})  [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.age}"
    end
    selected_person = @people[gets.chomp.to_i - 1]
    print 'Date: '
    date = gets.chomp
    @rentals << @IO.add_rental(date, selected_person, selected_book)
    puts 'Rental Created successfully'
    @IO.save_data
  end

   # List all rentals by ID
   def list_all_rentals()
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
end
