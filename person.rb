require './nameable'
require './capitalize_decorator'
require './trimmer_decorator'

class Person < Nameable
  attr_accessor :name, :age, :id, :rentals

  def initialize(age, name = 'Unknown', parent_permission: true)
    super()
    @id = Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end
end

# person = Person.new(22, 'maximilianus')
# puts person.correct_name
# capitalize_person = CapitalizeDecorator.new(person)
# puts capitalize_person.correct_name
# capitalize_trimmed_person = TrimmerDecorator.new(capitalize_person)
# puts capitalize_trimmed_person.correct_name
