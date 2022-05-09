require './person'
require './student'
require './teacher'

person = Person.new('Menge', false, 17)

p person.can_use_services?

teacher = Teacher.new('Menge', 32, 'Power Electronics')
p teacher.specialization
p teacher.name
p teacher.age
p teacher.can_use_services?

student1 = Student.new('Tom', 21, true, 'Sociology')
p '===========Student-1==========='
p student1.classroom
p student1.name
p student1.age
p student1.can_use_services?
p student1.play_hooky
p '=========== Student-2==========='
student2 = Student.new('David', 17, false, 'Biology')

p student2.classroom
p student2.name
p student2.age
p student2.can_use_services?
p student2.play_hooky
p '==============================='
