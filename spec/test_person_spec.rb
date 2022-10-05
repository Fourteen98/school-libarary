require_relative '../classes/person'

describe Person do
  context 'When creating a Person' do
    it 'Should create a new Person' do
      person = Person.new(34, 'Idrees')

      expect(person.name).to eq 'Idrees'
      expect(person.age).to eq 34
    end
  end
end
