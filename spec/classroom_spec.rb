require '../classroom'

describe Classroom do
  before :each do
    @classroom = Classroom.new('Math')
  end
  context 'Classroom#classroom' do
    it 'should be an instance of Classroom' do
      expect(@classroom).to be_an_instance_of Classroom
    end

    it('should renturn the lenght of #students in class') do
      expect(@classroom.students.length).to eql 0
    end
  end
end
