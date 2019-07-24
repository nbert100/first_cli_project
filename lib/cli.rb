
class CLI

  def call
    puts "\nWelcome to the New York Times Best Seller Selector!\n".colorize(:light_blue)
    call_scraper
    menu
  end
  
  def call_scraper
    Scraper.scrape_page
  end
  
  def menu
    puts "For a list of current best sellers, enter 'list'."
    puts "To see if your favorite book is on the list, enter 'title'."
    puts "To see if your favorite author has a book on the list, enter 'author'."
    puts "To see detailed list of current best sellers, enter 'details'."
    puts "\nTo exit the selector, enter 'exit'.".colorize(:blue)
    
    input = gets.strip.downcase
    case input
      when 'list'
        list_books
        puts "\nTo learn more about a particular book, please enter book title:"
        book_info_by_title
        inside_menu
      when 'exit'
        leave_selector
      when 'title'
        puts "\nPlease enter book title:"
        book_info_by_title
        inside_menu
      when 'author'
        puts "\nPlease enter author's name:"
        book_info_by_author
        inside_menu
      when 'details'
        list_all_details
        inside_menu
      else
        invalid_input
    end
  end
    

  def list_books
    Book.all.collect do |book| 
      puts "\n#{book.title} by #{book.author}\n"
    end
  end
  
  def more_info(book)
    puts "\n#{book.title} by #{book.author}".colorize(:cyan)
          puts "--------------------------------------"
          puts "Weeks on NYT Best Seller List: #{book.weeks_on}"
          puts "Publisher: #{book.publisher}"
          puts "For even more info: #{book.book_link}\n"
  end
  
  def list_all_details
    Book.all.collect {|book| more_info(book)}
  end

  def leave_selector
    puts "\nThank you for using NYT Selector. Goodbye!".colorize(:blue)
    exit!
  end
  
  def invalid_input
    puts "\nInvalid input. Please try again.\n".colorize(:red)
    menu
  end
  
  
  def book_info_by_title
    
        input = gets.strip.upcase
        selected_book = Book.find_by_title(input)
        if selected_book
          more_info(selected_book)
        else
          puts "\nSorry, that title isn't listed.\n"
          menu
        end
  end
  
  def book_info_by_author
    input = gets.strip.downcase
    selected_book = Book.find_by_author(input)
      if selected_book
        more_info(selected_book)
    else 
      puts "\nSorry, that author isn't listed.\n"
      menu
    end
  end
  
  def exit_message
    puts "To exit the selector, enter 'exit'.".colorize(:blue)
    input = gets.strip.downcase
      if input == 'exit'
        leave_selector
      else
        invalid_input
      end
  end
  
  def inside_menu
    puts "\nWhat would you like to do next?\n"
    puts "To choose another book, enter 'list'."
    puts "To go back to the main menu, enter 'menu'."
    puts "To exit the selector, enter 'exit'."
    
    input = gets.strip.downcase
    
      if input == 'list'
        list_books
        puts "Please enter book title:"
        book_info_by_title
        exit_message
      elsif input == 'menu'
        puts "\n"
        menu
      elsif input == 'exit'
        leave_selector
      else
        invalid_input
    end
  end
end
