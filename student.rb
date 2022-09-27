require './person.rb'

class Student < Person
  attr_accessor :classroom

  def initialize(classroom, id, name, age)
    super(name, age)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

end