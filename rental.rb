class Rental
  attr_accessor :date
  attr_reader :book, :person
  def initialize(date, book, person)
    @date = date
    @person = person
    @book = book
  end

  def to_hash
    hash = {}
    hash[:date] = @date
    hash[:person_id] = @person.id
    hash[:book_id] = @book.id
    hash
  end
end

# {'id'=>1,'name'=>'Dan'}<@kmnkdsk>
