require_relative 'Person'
class Student < Person
  def initialize(classroom, age, name = 'unknown', parent_permission: false)
    super(age, name, parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  attr_reader :classroom

  def classroom=(classroom)
    @classroom = classroom
    classroom.add_student(self)
  end
end
