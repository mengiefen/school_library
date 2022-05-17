require './person'
require './student'
require './teacher'

class PeopleOptions
  attr_reader :people

  def initialize
    @people = []
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

  def save_person
    File.write("people.json", @people, mode: "a")
  end

  def people_to_json
    data = []
    ruby = JSON.parse(source)
    @people.each do |n|
      data = '{"id": "foo", "name": 1.0, "age": true, "parental permision": true, "rental": false, "classroom": null}'
    end
    puts 'finish'
    # [{id:1, name: Some, age: age, classroom: classrom}]
    # people
    # json = JSON.generate(@people)
  end

  def to_json(*people)
    {
      JSON.create_id  => self.class.name,
      'a'             => [ bar, baz ]
    }.to_json(*args)
  end
end
