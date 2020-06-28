class GermanWines::CLI
    attr_accessor :sorted_wines # setting the setter/getter method with attr_accessor

    #Top-level note: any time you have a different action, make it a different method
    
    # start method should be the main flow that calls different methods
    def start
        puts "Welcome to the German Wine App!"
        puts "Here are the top German wines that we have for you today:"
        # make a call to the Scraper class - scrape all the wines
        GermanWines::Scraper.scrape_wines
        #after scraping, we want to sort alphabetically
        sort_wines
        # list all the wines
        list_wines
        # ask for user input
        get_wine
        # call another method
    end

    def sort_wines
        @sorted_wines = GermanWines::Wine.all.sort_by{|wine| wine.name}
    end

    def list_wines
        @sorted_wines.each.with_index(1) do |wine, index|
            puts "#{index}. #{wine.name}"
        end
    end

    def get_wine
        puts "Please select a wine to see more information by choosing a number."
        #input = gets.strip # return a copy of the user's input with leading and trailing whitespace removed using .strip

    end
end