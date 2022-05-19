require 'spec_helper'

describe Rental do
  before :each do
    @student = Student.new(12, 'babi', false, 'Biology')
    @teacher = Teacher.new(34, 'Ricky', 'Math')
    @book = Book.new('JavaScript', 'Menge')
    @rental = Rental.new('2022/05/05', @student, @book)
  end

  context '#new' do
    it 'should be and instance of Rental' do
      expect(@rental).to be_an_instance_of Rental
    end

    it 'should  return 1 as a length of rentals' do
      expect(@student.rentals.length).to eq 1
    end

    it 'should  return 3 as a length of rentals of teacher' do
      @student.add_rental(Rental.new('2022/05/09', @teacher, @book))
      @teacher.add_rental(Rental.new('2022/06/09', @teacher, @book))
      expect(@teacher.rentals.length).to eq 3
    end
  end
end
