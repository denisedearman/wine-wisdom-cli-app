class WiserWine::GrapeVariety
  require 'open-uri'
  require 'openssl'
  attr_accessor :name, :descriptors, :color_category, :color, :url
  @@reds = []
  @@whites = []
  def initialize
    @descriptors = []
  end

  def self.all
    scrape_grapes
    # grape_varieties = []
    # cab_franc = self.new
    # cab_franc.name = "Cabernet Franc"
    # cab_franc.descriptors = ["tobacco", "green bell pepper", "raspberry", "freshly mown grass"]
    # cab_franc.color_category = "red"
    # cab_franc.color = "blue-black"
    # cab_franc.url = "https://en.wikipedia.org/wiki/Cabernet_Franc"
    # grape_varieties << cab_franc
    # cab_sauvignon = self.new
    # cab_sauvignon.name = "Cabernet Sauvignon"
    # cab_sauvignon.descriptors = ["blackcurrants", "eucalyptus", "chocolate", "tobacco"]
    # cab_sauvignon.color_category = "red"
    # cab_sauvignon.color = "black"
    # cab_sauvignon.url = "https://en.wikipedia.org/wiki/Cabernet_Sauvignon"
    # grape_varieties << cab_sauvignon
    # grape_varieties
  end


  def self.scrape_grapes
    scraped_grapes = []
    url = "https://en.wikipedia.org/wiki/Wine_tasting"
    doc = Nokogiri::HTML open(url)
    tables = doc.css("table.multicol table.wikitable")
    tables.each do |table|
      rows = table.css("tr")
      rows.each do |row|
        name = row.css("td:first").text
        descriptors = row.css("td:nth-child(2)").text
        if name != ""
          grape = self.new
          grape.name = name
          grape.descriptors = descriptors.split(", ")
          scraped_grapes << grape
        end
      end
    end
    scraped_grapes
  end
end
