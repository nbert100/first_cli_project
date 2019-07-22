
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
       Book.new(attributes)
      end
  end
end      
       
 