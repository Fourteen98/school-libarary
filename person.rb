class Person
  attr_accessor :id, :name, :age

  def initialize(id, age, name='Unknown', parent_permission=true)
    @id = id
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  private
  def is_of_age?
    @age >= 18
  end

  def can_use_services?
    is_of_age? or @parent_permission
  end

end