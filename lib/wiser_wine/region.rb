class WiserWine::Region
attr_accessor :name, :description, :subregions

require 'open-uri'
require 'openssl'

  def initialize
    @subregions = []
  end

  def self.all
    scrape_regions
    # regions = []
    # usa = self.new
    # usa.name = "USA"
    # usa.description = "Info about US wine"
    # usa.subregions = ["California", "Oregon", "East Coast"]
    # regions << usa
    #
    # france = self.new
    # france.name = "France"
    # france.description = "Info about French wine"
    # france.subregions = ["Champagne", "Rhone", "Provence"]
    # regions << france
    #
    # germany = self.new
    # germany.name = "Germany"
    # germany.description = "Info about German wine"
    # germany.subregions = ["Baden", "Nahe"]
    # regions << germany
    # regions
  end

  def self.scrape_regions
    regions = []
    url = "https://en.wikipedia.org/wiki/List_of_wine-producing_regions"
    doc = Nokogiri::HTML open(url)
    list_region_links = doc.css("div.hatnote a")
    list_region_links.each do |link|
      puts link.text
    end
    binding.pry
  end

end
