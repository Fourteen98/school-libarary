describe Person do
  context 'Test if the decorator works on person class to capitalize the name' do
    person = Person.new(22, 'maximilianus')
    capitalize_person = CapitalizeDecorator.new(person)
    it 'It should return "Maximilianus" when calling correct_name method' do
      puts capitalize_person.correct_name
      expect(capitalize_person.correct_name).to eq 'Maximilianus'
    end

    it 'It should return The first 10 letters  of the name when calling correct_name method' do
      capitalize_trimmed_person = TrimmerDecorator.new(capitalize_person)
      expect(capitalize_trimmed_person.correct_name.size).to be >= 10
    end
  end
end
