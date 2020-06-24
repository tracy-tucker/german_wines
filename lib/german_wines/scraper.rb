class GermanWines::Scraper

    def self.scrape_wines
        index_page = Nokogiri::HTML(open("https://www.trulyfinewine.com/germanwine"))

        array_of_wines = index_page.css("#itemsBlock div.product-item")

        array_of_wines.each do |wine_card|
            binding.pry
        end
    end

    def self.scrape_descriptions(wine)
    end
end