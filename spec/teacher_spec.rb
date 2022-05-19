require './teacher'

describe Teacher do
  before :each do
    @teacher = Teacher.new(34, 'Ricky', 'Math')
  end

  context '#new' do
    it '@teacher should be an instance of Teacher' do
      expect(@teacher).to be_an_instance_of Teacher
    end

    it 'should return the specialization of the teacher' do
      expect(@teacher.specialization).to eq 'Math'
    end

    it 'should return true if the calling the function can_use_services' do
      expect(@teacher.can_use_services?).to eq true
    end

    it 'should return number for id of the teacher' do
      expect(@teacher.id).not_to eq nil
    end
  end
end
