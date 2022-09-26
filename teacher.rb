require_relative 'Person'
class Teacher < Person
  def initialize(specialization, age, name = 'unknown', parent_permission: false)
    super(name, age, parent_permission)
    @specialization = specialization
  end

  def can_use_services?
    true
  end
end
