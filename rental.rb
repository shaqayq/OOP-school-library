class Rental
  attr_accessor :date, :book, :person

  def initialize(date, book, person)
    @date = date
    @person = person
    @book = book
  end

  def person=(person)
    @person = person
    @person.rentals.push(self) unless @person.rentals.include?(self)
  end

  def book=(book)
    @book = book
    @book.rentals.push(self) unless @book.rentals.include?(self)
  end

  def to_hash
    hash = {}
    hash[:date] = @date
    hash[:person_id] = @person.id
    hash[:book_id] = @book.id
    hash
  end
end
