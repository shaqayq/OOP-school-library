require_relative 'rental'
class Book
  attr_accessor :title, :author, :rentals

  def initialize(title, author)
    @title = title
    @author = author
    @rental = []
  end

  def add_rental(date, _rental)
    Rental.new(date, self, person)
  end
end
