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
    @@all << self
  end
  
  def self.find_by_title(title)
      self.all.find {|book| book.title == title}
  end
 
  def self.find_by_author(author)
      self.all.find {|book| book.author.downcase == author}
  end  
  

  
end




