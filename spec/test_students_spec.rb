require_relative '../classes/student'

describe Student do
  context 'When creating a Student' do
    student = Student.new(classroom: 'Math', age: 22, id: nil, name: 'Elias', parent_permission: true)
    it "Should return 'Elias' as the student name" do
      expect(student.name).to eq 'Elias'
    end

    it "Should return '22' as the Student age" do
      expect(student.age).to eq 22
    end
  end
end
