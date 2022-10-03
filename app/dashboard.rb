class Dashboard
  def dashboard
    puts '----- Choose An Option -----'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - List all rentals for a given person id'
    puts '4 - Create a book'
    puts '5 - Create a person'
    puts '6 - Create a rental'
    puts '7 - Exit'
    puts '---------------------------'
  end

  def options(input)
    case input
    when '1'
      list_books
    when '2'
      list_people
    when '3'
      list_rentals_for_person_id
    when '4'
      create_book
    when '5'
      create_person
    when '6'
      create_rental
    when '7'
      puts 'Thank you for using this app!'
    else
      puts 'Invalid option'
    end
  end
end
