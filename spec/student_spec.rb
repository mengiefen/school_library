require '../student'
require '../person'

describe Student do
  before :each do
    @student = Student.new(12, 'babi', false, 'Biology')
  end

  context '#new' do
    it '@student should be an instance of Student' do
      expect(@student).to be_an_instance_of Student
    end

    it 'should return the classroom of the student' do
      expect(@student.classroom).to eq 'Biology'
    end

    it 'should print  "¯\(ツ)/" calling the function play_hooky' do
      expect(@student.play_hooky).to eq '¯\(ツ)/¯'
    end

    it 'should print  "¯\(ツ)/" calling the function play_hooky' do
      expect(@student.play_hooky).to eq '¯\(ツ)/¯'
    end
  end
end
