require '../person'

describe Person do
  before :each do
    @person1 = Person.new(6, 'Bahran')
    @person2 = Person.new(30, 'Micky')
    @person3 = Person.new(12, 'Sam', parent_permission: false)
  end

  context '#new' do
    it '@teacher should be an instance of Person' do
      expect(@person1).to be_an_instance_of Person
    end

    it 'should return false for parent_permission person1' do
      expect(@person1.parent_permission).to eq true
    end

    it 'calling can_use_services? for person1 should return false' do
      expect(@person1.can_use_services?).to eq true
    end

    it 'calling can_use_services? for person2 should return false' do
      expect(@person2.can_use_services?).to eq true
    end

    it 'calling can_use_services? for person3 should return false' do
      expect(@person3.can_use_services?).to eq false
    end
  end
end
