require './classes/book'
require './classes/rental'
require './classes/student'
require './classes/teacher'

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
    @people.each_with_index do |person, index|
      puts "#{index}) -> Type: #{person.class}, Name: \"#{person.name}\", ID: #{person.id}, Age: #{person.age}"
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

end
