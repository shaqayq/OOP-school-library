require_relative 'app'
class Options
  def initialize
    @app = App.new
  end

  def handel_options(option, main)
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
    main.user_input
  end

  def check_option(option, main)
    if option < 7
      handel_options(option, main)
    else
      @app.exit
    end
  end
end
