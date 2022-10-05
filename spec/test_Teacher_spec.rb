require_relative '../classes/teacher'

describe Teacher do
  context "When creating a Teacher" do

    teacher = Teacher.new('Math', 22,'Elias')
    it "Should return 'Elias' as a teacher name" do
      puts teacher.name
      expect(teacher.name).to eq "Elias"
    end

    it "Should return '22' as a teacher age" do
      expect(teacher.age).to eq 22
    end 
    
    it "Should return 'Math' as a teacher specialization" do
      expect(teacher.specialization).to eq 'Math'
    end 
  end
end