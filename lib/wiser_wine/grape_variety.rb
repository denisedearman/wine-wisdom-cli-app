class WiserWine::GrapeVariety
  require 'open-uri'
  require 'openssl'
  attr_accessor :name, :descriptors, :color, :url
  def initialize
    @descriptors = []
  end

  def self.all
    scrape_grapes
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
          grape.url =  row.css("td:first a").attribute("href").text
          scraped_grapes << grape
        end
      end
    end
    scraped_grapes
  end
end
