
class CLI

  def call
    puts "Welcome to the New York Times Best Seller Selector!"
    puts ""
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
    puts "To exit the selector, enter 'exit'."
    
    input = gets.strip.downcase
    case input
      when 'list'
        list_books
        puts "To learn more about a particular book, please enter book title:"
        book_info_by_title
        inside_menu
        
      when 'exit'
        leave_selector
      when 'title'
        puts "Please enter book title:"
        book_info_by_title
        exit_message
      when 'author'
        puts "Please enter author's name:"
        book_info_by_author
        exit_message
      when 'details'
        list_details
        exit_message
      else
        invalid_input
    end
  end
  
  def list_books
    Book.all.collect do |book| 
      
      puts ""
      puts "#{book.title} by #{book.author}"
      
    end
    puts ""
    
  end
  
  def list_details
    Book.all.collect do |book|
      puts ""
      puts "#{book.title} by #{book.author}"
          puts "--------------------------------------"
          puts "Weeks on NYT Best Seller List: #{book.weeks_on}"
          puts "Publisher: #{book.publisher}"
          puts "Link: #{book.book_link}"
          puts ""
    end
  end


  def leave_selector
    puts "Thank you for using NYT Selector. Goodbye!"
  end
  
  def invalid_input
    puts "Invalid input. Please try again."
    puts ""
    menu
  end
  
  # def exit_message
  #   puts "To exit the selector, enter 'exit'."
  #   input = gets.strip.downcase
  #   if input == "exit"
  #     leave_selector
  #   else
  #     invalid_input
  #   end
  # end
  
  def book_info_by_title
        input = gets.strip.upcase
        selected_book = Book.find_by_title(input)
        if selected_book
          Book.more_info(selected_book)
        # elsif input == 'exit'
        #   puts leave_selector
        else
          puts "Sorry, that title isn't listed."
          puts ""
          menu
        end
  end
  
  def book_info_by_author
    input = gets.strip.downcase
    selected_book = Book.find_by_author(input)
      if selected_book
        Book.more_info(selected_book)
    else 
      puts "Sorry, that author isn't listed."
      puts ""
      menu
    end
  end
  
  def exit_message
    input = gets.strip.downcase
    if input == 'exit'
      leave_selector
    else
      invalid_input
    end
  end
  
  def inside_menu
    puts ""
    puts "What would you like to do next?"
    puts ""
    puts "To choose another book, enter 'list'."
    puts "To go back to the main menu, enter 'menu'."
    puts "To exit the selector, enter 'exit'."
    
    input = gets.strip.downcase
    case input
      when 'list'
        list_books
        book_info_by_title
        exit_message
      when 'exit'
        exit_message
      else
        invalid_input
    end
  end
end
