class Person
  def initialize(age, name = 'unknown', parent_permission: true)
    @id = Ramdom.rand(0..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
  end

  atrr_accessor :name, :age
  atrr_reader :id

  def can_use_services?
    of_age? || @parent_permission
  end

  private

  def of_age?
    @age >= 18
  end
end
