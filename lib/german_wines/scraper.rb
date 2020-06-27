class GermanWines::Scraper

    def self.scrape_wines
        index_page = Nokogiri::HTML(open("https://www.trulyfinewine.com/germanwine"))

        array_of_wines = index_page.css("#itemsBlock div.product-item")

        array_of_wines.each do |wine_card|
            (
                name: wine_card.css("name").text,
                url: wine_card.css("a")[0]["href"],
                sub_title: wine_card.css(".product-subtitle").text,
                price: wine_card.css("span.price").text,
                list_price: wine_card.css(".retailprice").text,
                savings: wine_card.css(".savings").text
            )
        end
    end

    def self.scrape_descriptions(wine)
    end
end