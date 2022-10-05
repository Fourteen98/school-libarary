require_relative 'person'

class Student < Person
  attr_reader :classroom

  def initialize(classroom:, age:, id:, name: 'Unknown', parent_permission: true)
    super(age, name, parent_permission: parent_permission, id: id)
    @classroom = classroom
  end

  def export_json
    {
      'id' => @id,
      'name' => @name,
      'age' => @age,
      'parent_permission' => @parent_permission,
      'classroom' => @classroom
    }
  end

  def play_hooky
    '¯\(ツ)/¯'
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.students.include?(self)
  end
end
