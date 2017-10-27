class DrummingNews::Article
  attr_accessor :title, :author, :date, :magazine, :url, :excerpt
  @@all = []

  def initialize
    @@all << self
  end

  def self.all
    @@all
  end
end