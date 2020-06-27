class GermanWines::Wine
    attr_accessor :name, :url, :sub_title, :price, :list_price, :savings

    @@all = []

    def initialize(att_hash)
        att_hash.each do |key, value|
            self.send("#{key}=", value)
        end
    self.save
    end

    def save
        @@all << self #returns all wines
        self #returns current wine
    end

    def self.all
        @@all #returns all wines
    end
end