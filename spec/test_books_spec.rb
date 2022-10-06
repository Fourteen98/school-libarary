require_relative '../classes/book'
require_relative '../classes/student'
require_relative '../classes/rental'

describe Book do
  context 'when testing the Book class' do
    book = Book.new('Oliver Twist', 'Jafer Yousef')
    student1 = Student.new(classroom: 'Maths class', age: '22', id: '222', name: 'Jafer Yousef')
    rental = Rental.new('2022', book, student1)
    book.add_rental(rental)

    it "Should return  'Oliver Twist' as Book name" do
      expect(book.title).to eq 'Oliver Twist'
    end

    it "Should return  'Jafer Yousef' as Book author" do
      expect(book.author).to eq 'Jafer Yousef'
    end

    it 'The length of Book.rentals[] should be 2' do
      expect(book.rentals.length).to eq 2
    end
  end
end
