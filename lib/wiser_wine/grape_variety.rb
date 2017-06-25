class WiserWine::GrapeVariety
  require 'open-uri'
  require 'openssl'
  attr_accessor :name, :descriptors, :color, :url, :regions
  def initialize
    @descriptors = []
    @regions = []
  end

  def print_details
    puts "#{self.name}\n\n"
    if self.color
      puts "Color: #{self.color}\n\n"
    end
    puts "Common descriptors for #{self.name} include: #{self.descriptors.join(", ")}\n\n"
    if self.regions.length > 0
      puts "Notable regions include: #{self.regions.join(", ")}\n\n"
    end
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
          grape.url =  "https://en.wikipedia.org" << row.css("td:first a").attribute("href").text
          scrape_grape_details(grape)
          scraped_grapes << grape
        end
      end
    end
    scraped_grapes
  end

  def self.scrape_grape_details(grape)
    doc = Nokogiri::HTML open(grape.url)
    table = doc.css("table.infobox")
    rows = table.css("tr")
    rows.each do |row|
      if row.css("th").text.downcase.include?("color") || row.css("th").text.downcase.include?("colour")
        grape.color = row.css("td").text
      end
      if row.css("th").text.downcase.include?("region")
          grape.regions = row.css("td").text.split(", ")
      end
    end

  end




end
