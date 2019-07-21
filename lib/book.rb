class Book
  @@all = []

attr_accessor :title, :author, :weeks_on, :publisher, :book_link
  
  def self.all
    @@all
  end
  
  
  def initialize(attributes)
    attributes.each do |key, v|
      self.send("#{key.to_s}=", v)
  end
  
  def self.hello
    puts "Hello World"
  end
  
  def self.find_by_title(data)
    self.all.find do |book| if book.title == data
          puts "#{book.title} by #{book.author}"
          puts "--------------------"
          puts "Weeks on NYT Best Seller List: #{book.weeks_on}"
          puts "Publisher: #{book.publisher}"
        end
    end
    
    puts ""
          
  end
 
  def find_by_author(input)
    
      selected_book = self.all.find {|book| book.author == author}
  end  
  
  
    # @title = title
    # @author = author
    # @weeks_on = weeks_on
    # @publisher = publisher
    
    @@all << self
  end

  def self.find_by_title(input)
    self.all.find do |book| 
      if input == book.title
        return book_info

      else 
        return "Sorry, that one didn't make the cut."
      end
    end
  end
      
  def self.find_by_author(input)
   #returns a list of books by author

    self.all.find do |book| 
      if book.author == input
        return book_info

      else 
        return "Author not found."
      end
    end

  end
end



#if i only had a second level scrape 
# attr_accessor :price, :release_date, :pages

 # def book_details(more_info)
  #   more_info.each do |key, value|
  #     self.send("#{key.to_s}=", v)
  #   end
  # end
