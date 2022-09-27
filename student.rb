require './person'

class Student < Person
  attr_accessor :classroom

  def initialize(classroom, _id, name, age)
    super(name, age)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end
