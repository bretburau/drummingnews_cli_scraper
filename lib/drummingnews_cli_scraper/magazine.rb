class DrummingNews::Magazine
  attr_accessor :name, :articles
  @@all = []
  def initialize(name)
    @name = name
    @@all << self
  end

  def self.create(name)
    self.new(name)
  end

  def all
    @@all
  end
end