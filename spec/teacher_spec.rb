require_relative '../teacher'
require_relative '../person'

describe Teacher do
  it 'should initialize it\'s parameters correctly' do
    teacher = Teacher.new(32, 'technician', name: 'Mike')
    expect(teacher.age).to eql 32
    expect(teacher).to be_kind_of Person
  end
end
