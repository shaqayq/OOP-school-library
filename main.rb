require_relative 'options'
class Main
  def initialize
    @option = Options.new
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
    @option.check_option(option, self)
  end

  def welcome
    puts 'Welom to School library App.-'
    puts "\n"
    user_input
  end
end

def main
  app = Main.new
  app.welcome
end

main
