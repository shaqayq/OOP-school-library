class Rental
  attr_accessor :book, :title, :date

  def initialize(date, book, person)
    @date = date
    @person = person
    @book = book

    person.rentals << self
    book.rentals << self
  end
end
