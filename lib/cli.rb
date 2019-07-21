require 'pry'

class CLI

  def call
    self.call_scraper
    self.prints_options
    self.prompt_for_input
  end
  
  def prints_options
    puts "Welcome to the NYT Best Seller Selector!"
    puts "For a list of current best sellers, enter 'list'."
    puts "To see if your favorite book is on the list, enter 'title'."
    puts "To see if your favorite author has a book on the Best Seller list, enter 'author'."
    puts "To exit the selector, enter 'exit'."
  end
  
  def list_books
    Book.all.collect do |book| 
      
      puts ""
      puts "#{book.title} by #{book.author}"
      
    end
    # make new method
    puts ""
    puts "To learn more about a particular book, please enter book title:"
    puts exit_message
  end
  
  def prompt_for_input
    input = gets.strip.downcase
  
    case input
      when 'list'
        self.list_books
        # Book.find_by_title
        # self.book_info
      when 'exit'
        self.leave_selector
      when 'title'
        Book.find_by_title
        self.info_by_title
      when 'author'
        self.info_by_author
      else
        self.invalid_input
    end
  end
  
  def call_scraper
    Scraper.scrape_page
  end
  
  def find_info_by_title
    #Scraper.scrape_page
      input = gets.strip.downcase 
      if input == book.title
        puts info_by_title(input)
      elsif input == 'exit'
        puts leave_selector
      else
        puts invalid_input
      end
  end
    
  def select_book(input)
    input = gets.strip.downcase
    
  end
  
  def book_info
    # input = gets.strip.downcase
    
    # Book.all.find_all do |book| if book.title == input
      
          puts ""
          puts "#{selected_book.title} by #{selected_book.author}"
          puts "--------------------"
          puts "Weeks on NYT Best Seller List: #{selected_book.weeks_on}"
          puts "Publisher: #{selected_book.publisher}"
      
    #     else 
    #   puts "I couldn't find that title. Please try again."
    # end
    # end
  end

  def info_by_author(input)
    puts "Please enter title of book:"
    input = gets.strip
    Scraper.scrape_page
    Book.all.find do |book| if book.author == input
          puts ""
          puts "#{book.title} by #{book.author}"
          puts "--------------------"
          puts "Weeks on NYT Best Seller List: #{book.weeks_on}"
          puts "Publisher: #{book.publisher}"
        else
          puts "I couldn't find that author. Please try again."
      end
    end
  
  end

  # def book_detail
    
  #   #2nd level scrape info (price, overview, number of pages)
  # end
  
  def leave_selector
    puts "Thank you for using NYT Selector. Goodbye!"
  
  end
  
  def invalid_input
    puts "Invalid input. Please try again."
    puts ""
    self.call
  end
  
  def exit_message
    puts "To exit the selector, enter 'exit'."
  end
end
