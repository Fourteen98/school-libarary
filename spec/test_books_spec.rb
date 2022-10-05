require_relative '../classes/book'

describe Book do
  context 'when testing the Book class' do
    book = Book.new('Oliver Twist', 'Jafer Yousef')

    it "Should return  'Oliver Twist' as Book name" do
      expect(book.title).to eq 'Oliver Twist'
    end

    it "Should return  'Jafer Yousef' as Book author" do
      expect(book.author).to eq 'Jafer Yousef'
    end
  end
end
