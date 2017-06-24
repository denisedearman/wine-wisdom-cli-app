class WiserWine::GrapeVariety
  attr_accessor :name, :descriptors, :color_category, :color, :url
  @@reds = []
  @@whites = []
  def initialize
    @descriptors = []
  end

  def self.all
    grape_varieties = []
    cab_franc = self.new
    cab_franc.name = "Cabernet Franc"
    cab_franc.descriptors = ["tobacco", "green bell pepper", "raspberry", "freshly mown grass"]
    cab_franc.color_category = "red"
    cab_franc.color = "blue-black"
    cab_franc.url = "https://en.wikipedia.org/wiki/Cabernet_Franc"
    grape_varieties << cab_franc
    cab_sauvignon = self.new
    cab_sauvignon.name = "Cabernet Sauvignon"
    cab_sauvignon.descriptors = ["blackcurrants", "eucalyptus", "chocolate", "tobacco"]
    cab_sauvignon.color_category = "red"
    cab_sauvignon.color = "black"
    cab_sauvignon.url = "https://en.wikipedia.org/wiki/Cabernet_Sauvignon"
    grape_varieties << cab_sauvignon
    grape_varieties
  end
end
