require_relative '../classes/person'

describe Person do
  context 'When creating a Person' do
    person = Person.new(34, 'Idrees')

    it "It should return '34' as the Person age " do
      expect(person.age).to eq 34
    end

    it "It should return 'Idrees' as the Person name " do
      expect(person.name).to eq 'Idrees'
    end
  end
end
