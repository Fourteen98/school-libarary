require './person.rb'

class Student < Person
  attr_accessor :classroom

  def initialize(classroom, name, age, parent_permission)
    super(name, age)
    @classroom = classroom
  end

  def play_hooky
    '¯\(ツ)/¯'
  end
end