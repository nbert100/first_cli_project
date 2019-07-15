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
        break
      when 'title'
        self.search_title
      when 'author'
        self.find_by_author
      else
        self.invalid_input
        
      
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
    puts "To learn more about a particular book, please enter book title:"
    puts exit_message
    
    input = gets.strip
    if input = Book.find_by_title(input)
      puts info_by_title
    elsif input == "exit"
    puts leave_selector
    else
    
    puts invalid_input
    
    
    # def list_songs_by_artist
    # puts "Please enter the name of an artist:"
    # input = gets.strip
    # if artist = Artist.find_by_name(input)
    #   artist.songs.sort{ |a, b| a.name <=> b.name }.each.with_index(1) do |song, i|
    #     puts "#{i}. #{song.name} - #{song.genre.name}"
    #   end
    # end
  end
  
  def info_by_title(input)
    
    input = gets.strip
    Scraper.scrape_page
    Book.all.find do |book| if book.title == input
        puts ""
        puts "#{book.title} by #{book.author}"
        puts "--------------------"
        puts "Weeks on NYT Best Seller List: #{book.weeks_on}"
        puts "Publisher: #{book.publisher}"
    
      else 
     puts "I couldn't find that title. Please try again."
   end
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

  # def book_detail
    
  #   #2nd level scrape info (price, overview, number of pages)
  # end
  
  def leave_selector
    puts "Thank you for using NYT Selector. Goodbye!"
    break
  end
  
  def invalid_input
    puts "Please try again."
    self.call.new
  end
  
  def exit_message
    puts "To exit the selector, enter 'exit'."
    
  end
end
