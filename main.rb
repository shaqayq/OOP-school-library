require_relative 'app'
class Main
  def initialize
    @app = App.new
  end

  def handel_options(option)
    case option
    when 1
      @app.book_list
    when 2
      @app.people_list
    when 3
      @app.create_person
    when 4
      @app.create_book
    when 5
      @app.create_rental
    when 6
      @app.rental_list_by_id
    end
    user_input
  end

  def check_option(option)
    if option < 7
      handel_options(option)
    else
      @app.exit
    end
  end

  def user_input
    puts 'Please select your option by number:'
    puts '1- list all books'
    puts '2- list all people'
    puts '3- create a person (teacher or student)'
    puts '4- create a book'
    puts '5- create a rental'
    puts '6- list all rentals for a given person id'
    puts '7- Exit'

    option = gets.chomp.to_i
    check_option(option)
  end

  def welocm
    puts 'Welom to School library App.-'
    puts "\n"
    user_input
  end
end

def main
  app = Main.new
  app.welocm
end

main
