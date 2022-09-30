require_relative 'person'
class Student < Person
  attr_reader :classroom

  def initialize(age, name = 'unknown', classroom = 3, parent_permission: false)
    super(age, name, parent_permission: parent_permission)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.add_student(self)
  end
end
