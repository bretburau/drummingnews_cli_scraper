class DrummingNews::Magazine
  attr_accessor :name, :articles
  @@all = []
  def initialize(name)
    @articles = [] 
    @name = name
    @@all << self
  end

  def self.create(name)
    self.new(name)
  end

  def find(num)
    @articles[num-1]
  end

  def self.all
    @@all
  end
end