class GermanWines::Scraper

    def self.scrape_wines
        index_page = Nokogiri::HTML(open("https://www.trulyfinewine.com/germanwine"))

        array_of_wines = index_page.css("#itemsBlock div.product-item")

        array_of_wines.each do |wine_card|
            attributes = {
                name: wine_card.css(".name").text,
                url: wine_card.css("a")[0]["href"],
                sub_title: wine_card.css(".product-subtitle").text,
                price: wine_card.css("span.price").text,
                sale: wine_card.css(".sale").text,
                list_price: wine_card.css(".retailprice").text,
                savings: wine_card.css(".savings").text
            }
            wine = GermanWines::Wine.new(attributes)
        end
    end

    def self.scrape_details(wine)
        binding.pry
        details_page = Nokogiri::HTML(open("https://www.trulyfinewine.com/#{wine.url}"))
        details = details_page.css("#tab-1 p").text
        learn_more = details_page.css("#tab-4 p").text
        tour = details_page.css("#tab-5 p").text
        #object oriented CLI
        #instantiate new details
        #associate those details with this wine
        #add these details to german_wines
        #set any detail attributes
        #a wine has_many details

    end
end