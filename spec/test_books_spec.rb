require_relative '../classes/book'

describe Book do
  context 'when testing the Book class' do
    it 'Create Book' do
      book = Book.new('Oliver Twist', 'Jafer Yousef')

      expect(book.author).to eq 'Jafer Yousef'
      expect(book.title).to eq 'Oliver Twist'
    end
  end
end
