require_relative './person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(specialization, name, age, id:nil)
    super(name, age, id: id)
    @specialization = specialization
  end

  def export_json
    {
      'id' => @id,
      'name' => @name,
      'age' => @age,
      'parent_permission' => @parent_permission,
      'specialization' => @specialization
    }
  end

  def can_use_service?
    true
  end
end
