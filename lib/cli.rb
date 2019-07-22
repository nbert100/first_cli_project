

class CLI

  def call
    puts "Welcome to the New York Times Best Seller Selector!"
    puts ""
    self.call_scraper
    self.menu
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
        self.list_books
        puts "To learn more about a particular book, please enter book title:"
        self.book_info_by_title
        self.exit_message
      when 'exit'
        self.leave_selector
      when 'title'
        puts "Please enter book title:"
        self.book_info_by_title
      when 'author'
        puts "Please enter author's name:"
        self.book_info_by_author
      when 'details'
        self.list_details
      else
        self.invalid_input
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
    self.menu
  end
  
  def exit_message
    puts "To exit the selector, enter 'exit'."
  end
  
  def book_info_by_title
        input = gets.downcase
        Book.find_by_title(input)
        if selected_book = Book.find_by_title(input)
          Book.more_info(selected_book)
        else
          puts "Sorry, that title isn't listed."
          puts ""
          self.menu
        end
  end
  
  def book_info_by_author
    input = gets.strip.downcase
    if selected_book = Book.find_by_author(input)
      Book.more_info(selected_book)
    else 
      puts "Sorry, that author isn't listed."
      puts ""
      self.menu
    end
  end
  
end
