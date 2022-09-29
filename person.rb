require_relative 'nameable'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'

class Person < Nameable
  attr_accessor :name, :age
  attr_reader :id

  def initialize(age, name = 'unknown', parent_permission: true)
    super()
    @id = Random.rand(0..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rental = []
  end

  def can_use_services?
    of_age? || @parent_permission
  end

  def correct_name
    @name
  end

  private

  def of_age?
    @age >= 18
  end

  def add_rental(rental)
    @rental << rental
  end
end
