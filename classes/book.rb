class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rentals = []
  end

  def export_json
    {
      'Title' => @title,
      'Author' => @author
    }
  end

  def add_rental(rental)
    @rentals.push(rental)
    rental.book = self
  end
end
