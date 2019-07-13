class FirstCliProject::CLI

  def call
    puts "Welcome to the NYT Best Seller Selector!"
    #ask if user wants to see list of books 
    #if yes
    puts "Current best sellers:"
    list_books
    puts "Want to learn more about a specific book? Please enter name of book or 'exit' to exit selector"
    
  end
  
  def list_books
    #shows list of titles and authors of books on best seller list
  end
  
  def book_info
    #1st level scraping info (title, author, weeks on best seller list)
  end
  
  def book_detail
    #2nd level scrape info (price, overview, number of pages)
  end
  
  def leave_selector
    #if user input = 'exit'
    #puts "Thank you for using NYT Selector"
  end
end
