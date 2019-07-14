require 'pry'

class CLI

  def call
    input = ""
    puts "Welcome to the NYT Best Seller Selector!"
    puts "For a list of current best sellers, enter 'list'."
    puts "To see if your favorite book is on the list, enter 'title'."
    puts "To see if your favorite author has a book on the Best Seller list, enter 'author'."
    puts "To exit the selector, enter 'exit'."
    
    
    input = gets.strip
  
     case input
      when 'list'
        self.list_books
      when 'exit'
        self.leave_selector
      when 'title'
        self.search_title
      when 'author'
        self.find_by_author
      else
        puts "Please enter valid command."
        
      
      end
    Scraper.scrape_page
  end
  
  def list_books
    Scraper.scrape_page
    Book.all.collect do |book| 
      puts ""
      puts "#{book.title} by #{book.author}"
      
  end
    puts ""
    puts "To learn more about a particular book, please enter book title."
    puts ""
  end
  
  def search_title
    puts "Please enter title of book."
    info = gets.strip
    Scraper.scrape_page
    Book.all.find do |book| book.title == input
        puts ""
        puts "#{book.title} by #{book.author}"
        puts "--------------------"
        puts "Weeks on NYT Best Seller List: #{book.weeks_on}"
        puts "Publisher: #{book.publisher}"
    end
    # else 
    #   puts "I couldn't find that title. Please try again."
  
  end
  
  def book_detail
    
    #2nd level scrape info (price, overview, number of pages)
  end
  
  def leave_selector
    puts "Thank you for using NYT Selector. Goodbye!"
  end
  
  def exit_message
    puts "To exit the selector, enter 'exit'."
  end
end
