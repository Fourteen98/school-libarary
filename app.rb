require './book'
require './rental'
require './student'
require './teacher'
class App
  def initialize
    @books = []
    @people = []
    @rentals = []
  end

  # list all books
  def list_books
    @books.each_with_index do |book, index|
      puts "#{index}) -> Title: \"#{book.title}\", Author: #{book.author}"
    end
  end

  # list all people
  def list_people
    @people.each do |person|
      puts "Type: #{person.class}, Name: \"#{person.name}\", ID: #{person.id}, Age: #{person.age}"
    end
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

  def create_student
    print 'Name: '
    name = gets.chomp

    print 'Age: '
    age = gets.chomp

    print 'Student Class: '
    classroom = gets.chomp

    print 'Has parent permission? [Y/N]: '
    parent_permission = gets.chomp.downcase == 'y'

    student = Student.new(classroom: classroom, age: age, name: name, parent_permission: parent_permission)
    @people.push(student)
    puts 'Person created successfully'
  end

  def create_teacher
    print 'Age: '
    age = gets.chomp

    print 'Name: '
    name = gets.chomp

    print 'Specialization: '
    specialization = gets.chomp

    teacher = Teacher.new(age, specialization, name)
    @people.push(teacher)
    puts 'Person created successfully'
  end

  def create_book
    print 'Book Title: '
    title = gets.chomp

    print 'Book Author: '
    author = gets.chomp

    book = Book.new(title, author)
    @books.push(book)
    puts 'Book created successfully'
  end

  def create_rental
    puts 'Select a book from the following list by number'
    list_books
    book_index = gets.chomp.to_i

    puts 'Select a person from the following list by number (not id)'
    list_people
    person_index = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp

    rental = Rental.new(date, @books[book_index], @people[person_index])
    @rentals.push(rental)
    puts 'Rental created successfully'
  end

  def list_rentals_for_person_id
    print 'ID of person: '
    id = gets.chomp.to_i
    puts 'Rentals:'
    @rentals.each do |rental|
      puts "Date: #{rental.date}, Book \"#{rental.book.title}\" by #{rental.book.author}" if rental.person.id == id
    end
  end

  def dashboard
    puts '----- Choose An Option -----'
    puts '1 - List all books'
    puts '2 - List all people'
    puts '3 - Create a person'
    puts '4 - Create a book'
    puts '5 - Create a rental'
    puts '6 - List all rentals for a given person id'
    puts '7 - Exit'
    puts '---------------------------'
  end

  def option1(input)
    case input
    when '1'
      list_books
    when '2'
      list_people
    when '3'
      list_rentals_for_person_id
    end
  end

  def option2(input)
    case input
    when '4'
      create_person
    when '5'
      create_book
    when '6'
      create_rental
    when '7'
      puts 'Thank you for using this app!'
    else
      puts 'Invalid option'
    end
  end

  def run
    loop do
      dashboard
      input = gets.chomp
      break if input == '7'

      option1(input)
      option2(input)
    end
  end
end
