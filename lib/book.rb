class Book
  @@all = []

   attr_accessor :title, :author, :weeks, :publisher

  def self.all
    @@all
  end

  def initialize(title=nil, author=nil, weeks=nil, publisher=nil)
    @title = title
    @author = author
    @weeks = weeks
    @publisher = publisher
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
