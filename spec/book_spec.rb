require_relative '../book'

describe Book do
  context 'When give valid parameter' do
    it 'Return Class Object' do
      book = Book.new('HolyWar', 'Jame')
      expect(book).to be_instance_of(Book)
    end

    it 'Book Title and authore' do
      book = Book.new('Star', 'Tom')
      expect(book.title).to eql 'Star'
      expect(book.author).to eql 'Tom'
    end
  end
end
