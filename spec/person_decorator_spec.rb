require '../capitalize_decorator'
require '../trimmer_decorator'
require '../student'

describe 'Person Name Decorator' do
  before :each do
    @decorator = PersonDecorator.new('mengistu')
    @student = Student.new(12, 'babi', false, 'Biology')
    @student2 = Student.new(10, 'SomeLongNameOfAnotherStudent', false, 'Math')
    @capitalize = CapitalizeDecorator.new(@student)
    @trimmer = TrimmerDecorator.new(@student2)
  end

  context '#new' do
    it 'expect student to be an instance of person' do
      expect(@student).to be_an_instance_of Student
    end

    it 'Should captitalize the student name' do
      expect(@capitalize.correct_name).to eq 'Babi'
    end

    it 'should trim the name of student to 10 characters' do
      expect(@trimmer.correct_name).to eq 'SomeLongN'
    end
  end
end
