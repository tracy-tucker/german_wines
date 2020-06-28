class GermanWines::CLI
    attr_accessor :sorted_wines

    #Top-level note: any time you have a different action, make it a different method
    
    # start method should be the main flow that calls different methods
    def start
        puts "Welcome to the German Wine App!"
        puts "Here are the top German wines that we have for you today:"
        GermanWines::Scraper.scrape_wines
        sort_wines
        # make a call to the Scraper class - scrape all the wines
        # list all the wines
        list_wines
        get_wine
        # ask for input
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
    end
end