class WiserWine::Region
attr_accessor :name, :description, :subregions
@@all = []

  def initialize
    @subregions = []
    @@all << self
  end

  def self.all
    usa = self.new
    usa.name = "USA"
    usa.description = "Info about US wine"
    usa.subregions = ["California", "Oregon", "East Coast"]

    france = self.new
    france.name = "France"
    france.description = "Info about French wine"
    france.subregions = ["Champagne", "Rhone", "Provence"]

    germany = self.new
    germany.name = "Germany"
    germany.description = "Info about German wine"
    germany.subregions = ["Baden", "Nahe"]

    @@all
  end


end
