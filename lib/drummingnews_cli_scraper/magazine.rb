class DrummingNews::Magazine
  attr_accessor :name, :articles
  @@all = []
  def initialize(name)
    @articles = [] #Might need to delete this...set up for testing
    @name = name
    @@all << self
  end

  def self.create(name)
    self.new(name) #unless self.all.include?(name)
  end

  def find(num)
    @articles[num-1]
  end

  def self.all
    @@all
  end
end