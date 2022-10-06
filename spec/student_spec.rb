require_relative '../student'
require_relative '../person'

describe Student do
  before :each do
    @student = Student.new(13, 'Mark Jacob', 5, parent_permission: false)
  end

  context 'when student class object is created' do
    it 'should return correct values' do
      expect(@student.age).to eq(13)
      expect(@student.name).to eq('Mark Jacob')
      expect(@student.can_use_services?).to be false
    end
  end
end
