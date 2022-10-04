require 'fileutils'
require 'json'
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
      5 => 'Create a person',
      6 => 'Create a rental',
      7 => 'Exit'
    }
  end

  def create_student
    print 'Name: '
    name = gets.chomp

    print 'Age: '
    age = gets.chomp

    print 'Student Class: '
    classroom = gets.chomp

    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase == 'y'

    @my_app.create_student(classroom, age, name, parent_permission)
    puts 'Person created successfully'
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp

    print 'Name: '
    name = gets.chomp

    print 'Specialization: '
    specialization = gets.chomp

    @my_app.create_teacher(age, specialization, name)
    puts 'Person created successfully'
  end

  # create a person (teacher or student, not a plain Person)
  def create_person
    print 'Do you want to create a student (1) or a teacher (2)? [Input the number]: '
    person_type = gets.chomp

    case person_type
    when '1'
      create_student
    when '2'
      create_teacher
    else
      puts 'Invalid option'
      nil
    end
  end

  def main_menu
    choices.each { |key, value| print "#{key} - #{value}\n" }
  end

  def create_book
    print 'Book Title: '
    title = gets.chomp

    print 'Book Author: '
    author = gets.chomp

    @my_app.create_book(title, author)
    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number'
    @my_app.list_books
    book_index = gets.chomp.to_i

    puts 'Select a person from the following list by number (not id)'
    @my_app.list_people
    person_index = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp

    @my_app.create_rental(date, book_index, person_index)
    puts 'Rental created successfully'
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
      create_book
    when '5'
      create_person
    when '6'
      create_rental
    else
      puts 'Invalid option'
    end
  end

  def save_data
    Dir.mkdir('./app_data/') unless Dir.exists?('./app_data/')
    FileUtils.cd('./app_data/') do
      File.remove('books.json') if File.exists?('books.json')
      File.remove('people.json') if File.exists?('people.json')
      File.remove('rentals.json') if File.exists?('rentals.json')
      FileUtils.touch('books.json')
      FileUtils.touch('people.json')
      FileUtils.touch('rentals.json')

      # generate json object
      books_json = []
      @my_app.books.each do |book|
        books_json << book.to_json
      end

      people_json = []
      @my_app.books.each do |people|
        people_json << people.to_json
      end

      rentals_json = []
      @my_app.rentals.each do |rental|
        rentals_json << rental.to_json
      end

      # write data to their respective files
      File.write('books.json', books_json)
      File.write('people.json', people_json)
      File.write('rentals.json', rentals_json)
    end
  end

  def run
    loop do
      main_menu
      input = gets.chomp
      save_data if input == '7'
      break if input == '7'

      options(input)
    end
  end
end
