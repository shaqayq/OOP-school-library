require_relative './person'

class Student < Person
  attr_reader :classroom

  def initialize(age, name = 'Unknown', classroom = 5, parent_permission: true)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.students.push(self) unless classroom.student.include?(self)
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def to_s
    "[Student] #{super}"
  end

  def to_json(json)
    json.generate({ 'name' => @name, 'age' => @age, 'parent_permission' => @parent_permission })
  end
end
