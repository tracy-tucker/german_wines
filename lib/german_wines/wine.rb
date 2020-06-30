class GermanWines::Wine
    attr_accessor :name, :url, :sub_title, :price, :sale, :list_price, :savings
    attr_reader :details #OO

    @@all = []

    def initialize(att_hash)
        att_hash.each do |key, value|
            self.send("#{key}=", value)
        end
        @details = [] #OO
    self.save
    end

    def save
        @@all << self #returns all wines
        self #returns current wine
    end

    def self.all
        @@all #returns all wines
    end

    def add_details(dets)
        @details << dets
        dets.wine = self
    end
end