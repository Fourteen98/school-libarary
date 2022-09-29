require './person'

class Student < Person
  attr_accessor :classroom

  def initialize(classroom, age)
    super(age)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def class_room=(classroom)
    @classroom = classroom
    classroom.students << self
  end
end
