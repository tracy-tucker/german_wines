class GermanWines::Scraper

    def self.scrape_wines
        index_page = Nokogiri::HTML(open("https://www.trulyfinewine.com/germanwine"))
        binding.pry
    end

    def self.scrape_descriptions
    end
end