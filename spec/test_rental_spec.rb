require_relative '../classes/teacher'
require_relative '../classes/book'
require_relative '../classes/rental'

describe Rental do
  context 'When creating a Rental' do
    teacher = Teacher.new('Math', 22, 'Elias')
    book = Book.new('Lovely man', 'Elias')
    rental = Rental.new('28/10/2015', book, teacher)

    it "Should return 'Elias' as a rental person name" do
      expect(rental.person.name).to eq 'Elias'
    end

    it "Should return 'Lovely man' as a rental book title" do
      expect(rental.book.title).to eq 'Lovely man'
    end

    it "Should return 'Lovely man' as a rental book title" do
      expect(teacher.rentals[0].book.title).to eq 'Lovely man'
    end
  end
end
