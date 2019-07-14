require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper
 
  def self.scrape_page
    main_url = 'https://www.nytimes.com/books/best-sellers/hardcover-fiction'
    page = Nokogiri::HTML(open(main_url))
    book_container = page.css('.css-12yzwg4')
    book_list = book_container.css('div.css-xe4cfy')
    
    book_list.each do |book_box| 
     attributes = { 
      title: book_box.css('.css-5pe77f').text,
      author: book_box.css('.css-1j7a9fx').text.gsub("by ", ""),
      weeks_on: book_box.css('.css-1o26r9v').text,
      publisher: book_box.css('.css-heg334').text,
      book_link: book_box.css('.css-wq7ea0').attribute('href').text
     }
     
     book = Book.new(attributes)
     binding.pry
     book_url = book.book_link
     book_detail = Nokogiri::HTML(open(book_url))
     
    end
    
  end  
    
    #level two scrape
    
# def scrape_book_details
#   binding.pry
#   # book_link = self.get_page.css('.css-wq7ea0').attribute('href').value
#   book_page = Nokogiri::HTML(open(book_link))
  
#   # Book.new(attributes)
#   end
  
end


