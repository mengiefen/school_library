require './person'
require './rental'
require './student'
require './teacher'
require './classroom'

class App
  attr_reader :people, :rentals

  def initialize
    @people = []
    @rentals = []
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

  # # Create a rental.
  # def create_rental
  #   puts 'Select a book from the following list by serial number'
  #   puts ''
  #   list_all_books
  #   selected_book = @books[gets.chomp.to_i - 1]
  #   puts 'Select a person from the following list by serial number'
  #   puts ''
  #   list_all_people
  #   selected_person = @people[gets.chomp.to_i - 1]
  #   print 'Date: '
  #   date = gets.chomp
  #   @rentals << selected_person.add_rental(date, selected_book)
  # end

  # # List all rentals by ID
  # def list_all_rentals
  #   print 'ID of person: '
  #   id = gets.chomp.to_i
  #   person_details = @people.find { |person| person.id == id }
  #   if person_details
  #     puts 'Rentals'
  #     person_details.rental.each_with_index do |rental, index|
  #       puts "#{index + 1}) #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
  #     end
  #   else
  #     puts 'No rentals to show'
  #   end
  # end
end
