require './person'
require './student'
require './teacher'
require 'json'

class PeopleOptions
  attr_reader :people

  def initialize
    @people = []
    load_people
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
      save_people
    when '2'
      @people << create_teacher
      save_people
    else
      puts 'Please enter valid input'
    end
  end

  def save_people
    people_json = "[#{@people.map(&:to_json).join(',')}]"
    File.write('people.json', people_json)
  end

  def load_people
    data = JSON.parse File.read './people.json' if File.exist? './people.json'
    data.each do |person|
      if person.is_a?(Student)
        @people.push(Student.from_json(person))
      end
      if person.is_a?(Teacher)
        @people.push(Teacher.from_json(person))
      end
    end
  end
end
