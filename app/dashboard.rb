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

  # create a person (teacher or student, not a plain Person)
  def create_person
    @my_app.create_person
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

  # def convert_json(data)
  #   result = []
  #   data.each { |item| result << JSON.generate("title:#{item.title} author:#{item.author}")}
  #   result
  # end

  def save_data
    FileUtils.mkdir_p('./app_data/')
    FileUtils.cd('./app_data/') do
      FileUtils.rm_f('books.json')
      FileUtils.rm_f('people.json')
      FileUtils.rm_f('rentals.json')
      FileUtils.touch('books.json')
      FileUtils.touch('people.json')
      FileUtils.touch('rentals.json')

      # generate json object
      books_json = []
      @my_app.books.each { |book| books_json << JSON.generate(book.export_json) }
      people_json = []
      @my_app.people.each { |person| people_json << JSON.generate(person.export_json) }
      rentals_json = []
      @my_app.rentals.each { |rental| rentals_json << JSON.generate(rental.export_json) }

      # write data to their respective files
      File.write('books.json', books_json)
      File.write('people.json', people_json)
      File.write('rentals.json', rentals_json)
    end
  end

  def read_books_from_file
    return unless File.exist?('./app_data/books.json')

    books = []
    File.foreach('./app_data/books.json') { |book| books << JSON.parse(book) }
    books.each do |book|
      book.each do |single_book|
        @my_app.create_book(JSON.parse(single_book)['Title'], JSON.parse(single_book)['Author'])
      end
    end
  end

  def read_people_from_file
    return unless File.exist?('./app_data/people.json')

    people = []
    File.foreach('./app_data/people.json') { |line| people << JSON.parse(line) }

    people.each do |each_person|
      each_person.each do |person|
        if person['classroom'].nil?
          @my_app.people << Teacher.new(JSON.parse(person)['age'], JSON.parse(person)['specialization'],
                                        JSON.parse(person)['name'], id: JSON.parse(person)['id'])
        else
          @my_app.people << Student.new(classroom: JSON.parse(person)['classroom'], age: JSON.parse(person)['age'],
                                        name: JSON.parse(person)['name'], parent_permission:
                                          JSON.parse(person)['parent_permission'], id: JSON.parse(person)['id'])
        end
      end
    end
  end

  def read_rentals_from_file
    return unless File.exist?('./app_data/rentals.json')

    rentals = JSON.parse(File.read('./app_data/rentals.json'))
    rentals.each do |rental|
      r = JSON.parse(rental)
      person = @my_app.people.select { |single_person| single_person.id.to_i == r['person']['id'].to_i }

      b = r['book']['Title'] + r['book']['Author']
      book = @my_app.books.select { |single_book| (single_book.title + single_book.author) == b }

      @my_app.rentals << Rental.new(r['date'], book[0], person[0])
    end
  end

  def run
    read_books_from_file
    read_people_from_file
    read_rentals_from_file

    loop do
      main_menu
      input = gets.chomp
      save_data if input == '7'
      break if input == '7'

      options(input)
    end
  end
end
