require './io_handler'

class App
  def initialize
    @io = IoHandler.new
  end

  # List all books
  def list_all_books
    @io.books.each_with_index do |book, index|
      puts "#{index + 1})  Title: #{book.title}, Author: #{book.author}"
    end
  end

  # Create a book.
  def create_book
    print 'Title: '
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @io.add_book(title, author)
    puts 'Book created successfully!'
  end

  # List all people.
  def list_all_people
    @io.people.each_with_index do |person, index|
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
    @io.add_student(age, name, parent_permission, classroom)
    puts 'Person created successfuly'
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Specialization: '
    specialization = gets.chomp
    @io.add_teacher(age, name, specialization)
    puts 'Person created successfuly'
  end

  def create_person
    print 'Do you want to create a student (1) or a teacher (2) [enter the number]: '
    person_role = gets.chomp
    case person_role
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'Please enter valid input'
    end
  end

  # Create a rental.
  def create_rental
    puts 'Select a book from the following list by serial number'
    puts ''
    @io.books.each_with_index do |book, index|
      puts "#{index + 1})  Title: #{book.title}, Author: #{book.author}"
    end
    selected_book = @io.books[gets.chomp.to_i - 1]
    puts 'Select a person from the following list by serial number'
    puts ''
    @io.people.each_with_index do |person, index|
      puts "#{index + 1})  [#{person.class}] Name: #{person.name}, ID: #{person.id}, Age: #{person.id}"
    end
    selected_person = @io.people[gets.chomp.to_i - 1]
    print 'Date: '
    date = gets.chomp
    @io.add_rental(date, selected_person, selected_book)
    puts 'Rental Created successfully'
  end

  # List all rentals by ID
  def list_all_rentals()
    print 'ID of person: '
    id = gets.chomp.to_i

    rental_details = @io.rentals.select { |rental| rental.person.id == id }

    if rental_details.empty?
      puts 'No rentals to show'

    else
      puts 'Rentals'
      rental_details.each_with_index do |rental, index|
        puts "#{index + 1}) #{rental.date}, Book: #{rental.book.title} by #{rental.book.author}"
      end

    end
  end

  def save_all
    @io.save_data
  end
end
