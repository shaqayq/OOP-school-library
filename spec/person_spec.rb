require_relative '../person'
require_relative '../book'
require_relative '../rental'

describe Person do
  context 'When give valid parameter' do
    it 'Return Class Object' do
      person = Person.new(18, 'John Doe')
      expect(person).to be_an_instance_of(Person)
    end

    it 'Person Detail' do
      person = Person.new(23, 'Jame')
      expect(person.age).to eql 23
      expect(person.name).to eql 'Jame'
    end

    it 'Return name Unknow' do
      person = Person.new(23)
      expect(person.name).to eql 'Unknown'
    end

    it 'add_rentals' do
      person = Person.new(23, 'Jame', parent_permission: true)
      book = Book.new('rose', 'Tom')
      rental = Rental.new('2020-02-02', book, person)

      person.add_rentals(rental)

      expect(person.rentals.length).to eql 2
    end

    it 'True if age is 18' do
      person = Person.new(18, 'tom')
      expect(person.can_use_services?).to be true
    end
  end
end
