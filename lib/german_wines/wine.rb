class GermanWines::Wine
    attr_accessor :name, :url, :sub_title, :price, :list_price, :savings

    def initialize(att_hash)
        att_hash.each do |key, value|
            self.send("#{key}=", value)
        end
    end
end