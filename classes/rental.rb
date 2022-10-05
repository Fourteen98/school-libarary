class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @book = book
    @person = person
    book.rentals.push(self)
    person.rentals.push(self)
  end

  def export_json
    {
      'date' => @date,
      'book' => @book.export_json,
      'person' => @person.export_json
    }
  end
end
