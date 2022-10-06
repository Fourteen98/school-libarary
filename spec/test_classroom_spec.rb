require_relative '../classes/classroom'
require_relative '../classes/student'

describe ClassRoom do
  context 'When testing the Classroom class' do
    classroom = ClassRoom.new('Maths Class')
    student1 = Student.new(classroom: 'Maths class', age: '22', id: '222', name: 'Jafer Yousef')
    student2 = Student.new(classroom: 'English class', age: '32', id: '322', name: 'Elias Yousef')

    classroom.add_student(student1)
    classroom.add_student(student2)

    it 'Should return "Math Class" as a label value' do
      expect(classroom.label).to eq 'Maths Class'
    end

    it 'Should check student1 exist in classroom.student  ' do
      expect(classroom.students[0]).to eq student1
    end

    it 'Should check student2 exist in classroom.student  ' do
      expect(classroom.students[1]).to eq student2
    end
  end
end
