class GermanWines::CLI
    attr_accessor :sorted_wines # setting the setter/getter method with attr_accessor

    #Top-level note: any time you have a different action, make it a different method
    
    # start method should be the main flow that calls different methods
    def start
        # greet the user
        greeting
        # make a call to the Scraper class - scrape all the wines
        scrape_wines
        # give the user options
        menu
        #after scraping, we want to sort alphabetically
        #sort_wines
        # list all the wines
        #list_wines
        # ask for user input and show a teaser
        #get_wine
        # call another method
    end

    def greeting
        puts "Welcome to the German Wine App!"
    end

    def menu
        puts "If you would like to see a list of wines, type Y(yes)/N(no)"
        puts "If you would like to exit, type 'exit'."

        input = gets.strip.upcase

        case input
        when "Y", "YES"
            puts "Here are the top German wines that we have for you today."
            sort_wines
            list_wines
            get_wine
        when 'EXIT', "N", "NO"
            puts "Good-bye!"
        else
            puts "Invalid selection. Please try again."
            menu #recursion
        end
    end

    def scrape_wines
        GermanWines::Scraper.scrape_wines
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
        puts "Please choose a number that corresponds to a wine. Or, type 'EXIT' to exit."
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
        puts "- https://www.trulyfinewine.com/~#{wine.url}"
        puts "- #{wine.sub_title}"
        puts "- #{wine.price}"
        puts "- #{wine.sale}"
        puts "- #{wine.list_price}"
        puts "- #{wine.savings}"
        # ask user if they want more info
        want_more_details(wine)
        menu 
        # ADD MENU HERE
    end

    def want_more_details(wine)
        puts "Read more about this wine? (Y/N)"
        input = gets.strip.upcase
        until ["Y", "N", "YES", "NO"].include?(input)
            puts "Please type Y(yes) or N(no)"
            input = gets.strip.upcase
        end
        if input == "Y" || input == "YES"
            puts "... fetching the details \n"
            GermanWines::Scraper.scrape_details(wine) if wine.details == [] #wine represents the wine object the user selected
            wine.details.each do |wine|
                puts "DESCRIPTION: #{wine.description} \n\n"
                puts "LEARN MORE: #{wine.learn_more} \n\n"
                puts "TOUR: #{wine.tour} \n\n"
            end
        else
        end
    end
end