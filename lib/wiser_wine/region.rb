class WiserWine::Region
attr_accessor :name, :description, :subregions


  def initialize
    @subregions = []
  end

  def self.all
    regions = []
    usa = self.new
    usa.name = "USA"
    usa.description = "Info about US wine"
    usa.subregions = ["California", "Oregon", "East Coast"]
    regions << usa

    france = self.new
    france.name = "France"
    france.description = "Info about French wine"
    france.subregions = ["Champagne", "Rhone", "Provence"]
    regions << france

    germany = self.new
    germany.name = "Germany"
    germany.description = "Info about German wine"
    germany.subregions = ["Baden", "Nahe"]
    regions << germany
    regions
  end


end
