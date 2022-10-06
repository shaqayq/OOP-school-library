require_relative '../class_room'
require_relative '../student'

describe Classroom do
  it 'should initialzie it\'s parameters correctly' do
    c = Classroom.new('My class')
    expect(c.label).to eql 'My class'
  end

  it 'should correctly add a student' do
    c = Classroom.new('My class')
    s = Student.new(13, 'Mark Jacob', c, parent_permission: false)
    c.add_student(s)

    expect(c.student.length).to eql 1
  end
end
