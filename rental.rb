class Rental
  attr_accessor :date

  def initialize(date)
    @date = date
  end

  def book=(book)
    @book = book
    book.rentals << self
  end
end
