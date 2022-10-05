require_relative 'book'
require_relative 'teacher'
require_relative 'student'
require_relative 'rental'
require_relative 'person'
require_relative 'file'

class App
  attr_accessor :rentals, :books, :people, :file

  def initialize
    @file= Files.new
    @books = file.objects_from_array(file.read_from_file('book.json')) || []
    @people = file.objects_from_array(file.read_from_file('people.json')) || []
    @rental = file.rentals_from_array(file.read_from_file('rental.json'),@books,@people) || []
  end

  def book_list
    puts 'Books List:'
    if @books.empty?
      puts 'Ther is not any book!'
    else
      @books.each_with_index do |book, index|
        puts "#{index + 1}- #{book.title} by #{book.author}"
      end
    end
    puts "\n"
  end

  def people_list
    puts 'People List:'
    if @people.empty?
      puts 'Ther is not any person!'
    else
      @people.each_with_index do |person, index|
        puts " #{index + 1}- ID: #{person.id} #{person.name} "
      end
    end
    puts "\n"
  end

  def create_book
    print 'Title:'
    title = gets.chomp
    print 'Author: '
    author = gets.chomp
    @books.push(Book.new(title, author))

    puts 'Your Book Create successfuly!'
    puts "\n"
  end

  def create_person
    puts 'Do you want to create a student (1) or teacher (2)?[Input the number]'
    number = gets.chomp.to_i
    if number == 1
      create_student
    else
      create_teacher
    end
    puts "\n"
  end

  def create_student
    print 'Age:'
    age = gets.chomp
    print 'Name:'
    name = gets.chomp
    print 'Has Parent Permission?[Y/N] '
    permission = gets.chomp

    @people.push(Student.new(age, name, parent_permission: permission))

    puts 'Student Successfully Add!'
    puts "\n"
  end

  def create_teacher
    print 'Age:'
    age = gets.chomp
    print 'Name: '
    name = gets.chomp
    print 'Specialization:'
    specialization = gets.chomp

    @people.push(Teacher.new(specialization, age, name, parent_permission: false))
    puts 'Successfuly Add Teacher!'
    puts "\n"
  end

  def create_rental
    puts 'Select a book from the following list by number:'
    book_list
    book_index = gets.chomp.to_i

    puts 'Select a person from the following list by number:'
    people_list
    people_index = gets.chomp.to_i

    print 'Date: '
    date = gets.chomp

    @rental.push(Rental.new(date, books[book_index - 1], people[people_index - 1]))

    puts 'Rental create successfully!'
    puts "\n"
  end

  def rental_list_by_id
    print 'ID of person: '
    id = gets.chomp.to_i

    person1 = @people.select { |p| p.id == id }[0]
    print person1.name
    if person1.name
      person1.rentals.each do |rental|
        puts "Rental Date: #{rental.date}, Book: #{rental.book.title} by #{rental.person.name}"
      end
    else
      puts 'Please enter correct ID!'
    end
    puts "\n"
  end

  def exit

    @file.write_into_file(@books , 'book.json')
    @file.write_into_file(@people , 'people.json')
    @file.write_into_file(@rental, 'rental.json')
    abort 'Thank you for using this App!'
  end
end
