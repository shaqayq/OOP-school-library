require_relative 'person'
class Student < Person
  attr_reader :classroom

  def initialize(age, name = 'unknown', classroom = 3, parent_permission: false, id:nil)
    super(age, name, parent_permission: parent_permission, id: id)
    @classroom = classroom
  end

  def play_hooky
    "¯\(ツ)/¯"
  end

  def classroom=(classroom)
    @classroom = classroom
    classroom.add_student(self)
  end

  def to_hash
    hash = {}
    hash[:class] = self.class
    hash[:age] = @age
    hash[:name] = @name
    hash[:parent_permission] = @parent_permission
    hash[:id] = @id
    hash
  end

  def self.create_from_hash(hash)
    Student.new(hash['age'], hash['name'], parent_permission: hash['parent_permission'], id: hash['id'])
  end
end
