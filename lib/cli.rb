require 'pry'

class CLI

  def call
    puts "Welcome to the New York Times Best Seller Selector!"
    self.call_scraper
    self.menu
    # self.prompt_for_input
  end
  
  def call_scraper
    Scraper.scrape_page
  end
  
  def menu
    puts "For a list of current best sellers, enter 'list'."
    puts "To see if your favorite book is on the list, enter 'title'."
    puts "To see if your favorite author has a book on the list, enter 'author'."
    puts "To exit the selector, enter 'exit'."
    
    input = gets.strip.downcase
    case input
      when 'list'
        self.list_books
      when 'exit'
        self.leave_selector
      when 'title'
        puts "To learn more about a particular book, please enter book title:"
        input = gets.downcase
        selected_book = Book.find_by_title(input)
      when 'author'
        Book.hello
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
    puts exit_message
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
end
