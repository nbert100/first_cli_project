class Book
  @@all = []

   attr_accessor :title, :author, :weeks_on, :pages, :price, :publisher, :book_link, :release_date

  def self.all
    @@all
  end
  
  # def self.new_from_scrape_page(b)
  #   self.new(title: b.css('.css-5pe77f').text,
  #       author: b.css('.css-1j7a9fx').text.gsub("by ", ""),
  #       weeks_on: b.css('.css-1o26r9v').text,
  #       publisher: b.css('.css-heg334').text,)
  # end

  def initialize(attributes)
    attributes.each do |key, v|
      self.send("#{key.to_s}=", v)
    end
  
  
  # def book_details(more_info)
  #   more_info.each do |key, value|
  #     self.send("#{key.to_s}=", v)
  #   end
  # end
    
    # @title = title
    # @author = author
    # @weeks_on = weeks_on
    # @publisher = publisher
    
    @@all << self
  end

  def self.find_by_title(title)
    self.all.find do |book| 
      if book.title == title
        return book_info

      else 
        return "Sorry, that one didn't make the cut."
      end
    end
  end
      
  def self.find_by_author(author)
   #returns a list of books by author

    self.all.find do |book| 
      if book.author == author
        return book_list

      else 
        return "Author not found."
      end
    end

  end
end
