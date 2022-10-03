require_relative 'app'

class Dashboard

  def initialize
    @my_app = App.new
  end
  def choices
    {
      1 => 'List all books',
      2 => 'List all people',
      3 => 'List all rentals for a given person id',
      4 => 'Create a book',
      5 =>  'Create a person',
      6 =>  'Create a rental',
      7 =>  'Exit'
    }
  end

  def main_menu
    choices.each { |key, value| print "#{key} - #{value}\n"}
  end

  def options(input)
    case input
    when '1'
      @my_app.list_books
    when '2'
      @my_app.list_people
    when '3'
      @my_app.list_rentals_for_person_id
    when '4'
      @my_app.create_book
    when '5'
      @my_app.create_person
    when '6'
      @my_app.create_rental
    when '7'
      puts 'Thank you for using this app!'
    else
      puts 'Invalid option'
    end
  end

  def run
    loop do
      main_menu
      input = gets.chomp
      break if input == '7'

      options(input)
    end
  end
end
