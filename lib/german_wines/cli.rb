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
        # ask for user input and show a teaser
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
        puts "Please choose a number that corresponds to a wine."
        input = gets.strip
        until valid_input(input, @sorted_wines) || input == "exit"
            puts "Invalid selection. Please try again."
            input = gets.strip.to_i
        end
        if input != "exit"
            index = input.to_i - 1
            wine = @sorted_wines[index]
            show_wine(wine)
        end
    end

    def valid_input(input, data)
        input.to_i <= data.length && input.to_i > 0
    end

    def show_wine(wine)
        # wine = @sorted_wines[selected_wine - 1]
        puts "More information about:"
        puts "- #{wine.name}"
        puts "- #{wine.url}"
        puts "- #{wine.sub_title}"
        puts "- #{wine.price}"
        puts "- #{wine.sale}"
        puts "- #{wine.list_price}"
        puts "- #{wine.savings}"
        # ask user if they want more info
        want_more_info(wine)
        puts "Please select a corresponding movie number, or type 'exit' to exit."
    end

    def want_more_info(wine)
        puts "Read more about this wine? (Y/N)"
        input = gets.strip.upcase
        until ["Y", "N", "YES", "NO"].include?(input)
            puts "Please type Y(yes) or N(no)"
            input = gets.strip.upcase
        end
        if input == "Y" || input == "YES"
            GermanWines::Scraper.scrape_details(wine) #wine represents the wine object the user selected
        else
            puts "you ended"
        end
    end
end