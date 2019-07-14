require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper
  
  
  def self.scrape_main_page
    main_url = 'https://www.nytimes.com/books/best-sellers/hardcover-fiction'
    page = Nokogiri::HTML(open(main_url))
    
    #books = []
    
    
    
    book_container = page.css('.css-12yzwg4')
    book_list = book_container.css('div.css-xe4cfy')
    
    book_list.each do |book| 
     attributes = { 
      title: book.css('.css-5pe77f').text,
      author: book.css('.css-1j7a9fx').text.gsub("by ", ""),
      weeks_on: book.css('.css-1o26r9v').text,
      publisher: book.css('.css-heg334').text,
      bn_link: book.css('.css-wq7ea0').attribute('href').text
     }
     
      Book.new(attributes)
      
    end
  end  
    
  #   book_hash = {:title => title, :author => author, :weeks_on => weeks_on, :publisher => publisher}
  #   books << book_hash
  # end
  
  
  def self.scrape_book_details
    
    bn_url = page.css('.css-wq7ea0').attribute('href').text
    detail_page = Nokogiri::HTML(open(bn_url))
    
    
  end
  
end

