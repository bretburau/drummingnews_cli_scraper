class DrummingNews::Article
  attr_accessor :title, :magazine, :url
  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end
end