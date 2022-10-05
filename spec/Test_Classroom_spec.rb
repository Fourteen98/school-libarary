require_relative '../classes/classroom'
require_relative '../classes/student'

describe ClassRoom do
  context 'When testing the Classroom class' do

    it 'should create classroom' do
      student_1 = Student.new(classroom: 'Maths class', age: '22', id: '222', name: 'Jafer Yousef')
      student_2 = Student.new(classroom: 'English class', age: '12', id: '122', name: 'Elias Yousef')


      classroom = ClassRoom.new('Maths Class')
      classroom.add_student(student_1)
      classroom.add_student(student_2)

      expect(classroom.students[0]).to eq student_1
      expect(classroom.students[1]).to eq student_2
    end
  end
end