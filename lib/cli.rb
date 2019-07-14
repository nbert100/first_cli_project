require 'pry'
class CLI

  def call
    input = ""
    puts "Welcome to the NYT Best Seller Selector!"
    puts "For a list of current best sellers, enter 'list'."
    puts "To exit the selector, enter 'exit'."
    #ask if user wants to see list of books 
    #if yes
    
    input = gets.strip
  
     case input
      when 'list'
        self.list_books
      when 'exit'
        self.leave_selector
      else
        "Please enter valid command."
      end
    
    
    Scraper.scrape_main_page
    # binding.pry
  end
  
  def list_books
    Book.all
  end
  
  def book_info
    #1st level scraping info (title, author, weeks on best seller list)
  end
  
  def book_detail
    #2nd level scrape info (price, overview, number of pages)
  end
  
  def leave_selector
    puts "Thank you for using NYT Selector. Goodbye!"
  end
end
