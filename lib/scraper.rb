# require 'nokogiri'
# require 'open-uri'
# require 'pry'

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
        }
      #different path for website due to button issue
       
       attributes[:book_link] = book_list.css('.css-6mwynb').css("li")[1].css("a").attribute('href').value
       book = Book.new(attributes)
       
      end
  end
  
    
   
    
end      
       
       
       
#         second level scrape
       
#       book = Book.new(attributes, more_info = nil)
# #---- pry here works
#           book_url = book.book_link
#           book_detail_doc = Nokogiri::HTML(open(book_url))
        
#           bd_page = book_detail_doc.css('div.book-page')
#           book_doc = bd_page.css('div#book-data.book-top-section')
          
#           book_doc.each do |info| 
#             more_info = {
#               pages: info.css('.ibc-pub-info')[0].text.strip.split(",").pop,
#               price: info.css('span#list-price-price').text.gsub("*",""),
#               release_date: info.css('p.ibc-pub-info')[1].text.split(": ").pop
#             }
#           end

 
   
# def get_page
#     main_url = 'https://www.nytimes.com/books/best-sellers/hardcover-fiction'
#     page = Nokogiri::HTML(open(main_url))
#   end

#   def scrape_book_index
#     self.get_page.css('.css-12yzwg4').css('div.css-xe4cfy')
#   end

#   def get_books
    
#     scrape_book_index.each do |b|
#       Book.new_from_main_page(b)
#       binding.pry
#     end
#   end



