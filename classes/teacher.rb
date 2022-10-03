require_relative './person'

class Teacher < Person
  attr_accessor :specialization

  def initialize(specialization, name, age)
    super(name, age)
    @specialization = specialization
  end

  def can_use_service?
    true
  end
end
