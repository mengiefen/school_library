require '../book'

describe Book do
  before :each do
    @book = Book.new('JavaScript', 'Menge')
  end

  context '#new' do
    it 'it takes two arguments' do
      expect(@book).to be_an_instance_of Book
    end
  end

  it 'should return JavaScript when #new is called' do
    expect(@book.title).to eq 'JavaScript'
  end

  it 'should return Menge when #new is called' do
    expect(@book.author).to eq 'Menge'
  end
end
