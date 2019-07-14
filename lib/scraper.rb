require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper
 
 def self.scrape_page
   main_url = 'https://www.amazon.com/Books/b/?ie=UTF8&node=549028&ref_=sv_b_5'
   page = Nokogiri::HTML(open(main_url))
   book_container = page.css('.a-carousel-viewport')
   book_list = book_container.css('.a-carousel-card.acswidget-carousel__card')
   book_list.each do |book_box| 
     binding.pry
    attributes = { 
      title: book_box.css('.a-link-normal').text.strip,
      author: book_box.css('.acs_product-metadata__contributors').text,
      current_price: book_box.css('.a-size-base.a-color-price.acs_product-price__buying').text.gsub(" ", "")
      book_link: book_box.css('.css-wq7ea0').attribute('href').value
      
    }
        
    book = Book.new(attributes)
   end
 end
 
#   def self.scrape_page
#     main_url = 'https://www.nytimes.com/books/best-sellers/hardcover-fiction'
#     page = Nokogiri::HTML(open(main_url))
#     book_container = page.css('.css-12yzwg4')
#     book_list = book_container.css('div.css-xe4cfy')
    
#     book_list.each do |book_box| 
#     attributes = { 
#       title: book_box.css('.css-5pe77f').text,
#       author: book_box.css('.css-1j7a9fx').text.gsub("by ", ""),
#       weeks_on: book_box.css('.css-1o26r9v').text,
#       publisher: book_box.css('.css-heg334').text,
#       #book_link: book_box.css('.css-wq7ea0').attribute('href').value
      
#     }
        
#     book = Book.new(attributes)
     
#     book_url = book.book_link
#     binding.pry
#     book_detail = Nokogiri::HTML(open(book_url))
     
#     end
    
#   end  
    
#     #level two scrape
    
# # def scrape_book_details
# #   binding.pry
# #   # book_link = self.get_page.css('.css-wq7ea0').attribute('href').value
# #   book_page = Nokogiri::HTML(open(book_link))
  
# #   # Book.new(attributes)
# #   end
  
end


