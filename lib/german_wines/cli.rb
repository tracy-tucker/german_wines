class GermanWines::CLI
    #Top-level note: any time you have a different action, make it a different method
    
    # start method should be the main flow that calls different methods
    def start
        puts "Welcome to the German Wine App!"
        puts "Here are the top German wines that we have for you today:"
        # make a call to the Scraper class - scrape all the wines
        # list all the wines
        list_wines
        # ask for input
        # call another method
    end

    def list_wines
        GermanWines::Wine.all.each.with_index(1) do |wine, index|
            puts "#{index}. #{wine.name}"
    end
end