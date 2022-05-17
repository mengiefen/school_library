require './person'
require './student'
require './teacher'
require 'json'

class PeopleOptions
  attr_reader :people

  def initialize
    @people = []
    load_student
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
      save_student
    when '2'
      @people << create_teacher
    else
      puts 'Please enter valid input'
    end
  end

  def load_student
    data = JSON.parse File.read './student.json' if  File.exist? './student.json'
    data.each do |student|
      @people.push(Student.from_json(student))
    end
  end

  def save_student
    people_json = "[#{@people.map(&:to_json).join(',')}]"
    File.write('student.json', people_json)
  end
end
