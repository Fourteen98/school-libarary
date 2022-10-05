require_relative '../classes/person'

describe Person do
  context "When creating a Person" do

    it "Should create a new Person" do
      person = Person.new(age: "34", name: "Idrees")
    end
  end
end