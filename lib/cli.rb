require 'pry'

class CLI

  def call
    self.call_scraper
    self.prints_options
    # self.prompt_for_input
  end
  
  def call_scraper
    Scraper.scrape_page
  end
  
  def prints_options
    puts "Welcome to the New York Times Best Seller Selector!"
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
        self.find_info_by_title
      when 'author'
        self.find_info_by_author
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
    puts "To learn more about a particular book, please enter book title:"
    
    puts exit_message
    
    
    
    # input = gets.strip.downcase
    # if input = Book.find_by_title(input)
    #   puts self.book_info
    # else
    #   puts invalid_input
    # end
  end
  
  
  def find_info_by_title
    
    puts "To learn more about a particular book, please enter book title:"
    input = gets.strip.downcase
    Book.find_by_title(input)
          # puts ""
          # puts "#{book.title} by #{book.author}"
          # puts "--------------------"
          # puts "Weeks on NYT Best Seller List: #{book.weeks_on}"
          # puts "Publisher: #{book.publisher}"
    #   elsif input == 'exit'
    #     puts leave_selector
    #   else
    #     puts invalid_input
    #   end
    # end
  end
    
  # def book_info
  
  #         puts ""
  #         puts "#{selected_book.title} by #{selected_book.author}"
  #         puts "--------------------"
  #         puts "Weeks on NYT Best Seller List: #{selected_book.weeks_on}"
  #         puts "Publisher: #{selected_book.publisher}"
      
  #   #     else 
  #   #   puts "I couldn't find that title. Please try again."
  #   # end
  #   # end
  # end

  # def info_by_author(input)
  #   puts "Please enter title of book:"
  #   input = gets.strip
  #   Scraper.scrape_page
  #   Book.all.find do |book| if book.author == input
  #         puts ""
  #         puts "#{book.title} by #{book.author}"
  #         puts "--------------------"
  #         puts "Weeks on NYT Best Seller List: #{book.weeks_on}"
  #         puts "Publisher: #{book.publisher}"
  #       else
  #         puts "I couldn't find that author. Please try again."
  #     end
  #   end
  
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
