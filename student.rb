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

  def classroom=(classroom)
    @classroom = classroom
    classroom.students << self unless classroom.students.include?(self)
  end
end
