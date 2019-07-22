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
  
  def self.hello
    puts "Hello World"
  end
  
  def self.find_by_title(title)
    self.all.find {|book| book.title == title}
    
    
          # puts "#{book.title} by #{book.author}"
          # puts "--------------------"
          # puts "Weeks on NYT Best Seller List: #{book.weeks_on}"
          # puts "Publisher: #{book.publisher}"
  end
 
  def self.find_by_author(author)
    
      self.all.find {|book| book.author == author}
  end  
  
  def self.more_info(book)
    puts "#{book.title} by #{book.author}"
          puts "--------------------"
          puts "Weeks on NYT Best Seller List: #{book.weeks_on}"
          puts "Publisher: #{book.publisher}"
  end
  
end




