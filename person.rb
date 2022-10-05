require_relative 'nameable'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'

class Person < Nameable
  attr_accessor :name, :age, :id
  attr_reader :rentals

  def initialize(age, name = 'unknown', parent_permission: true,id: nil)
    super()
    @id = id || Random.rand(1..1000)
    @name = name
    @age = age
    @parent_permission = parent_permission
    @rentals = []
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

  def add_rental(date, book)
    Rental.new(date, book, self)
  end

  def self.create_from_hash(hash)
    Person.new(hash['age'], hash['name'],id: hash['id'])
  end
end
