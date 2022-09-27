require './person.rb'

class Teacher < Person
  attr_accessor :specialization

  def initialize(specialization, id, name, age)
    super(id, name, age)
    @specialization = specialization
  end

  def can_use_service?
    true
  end

end
