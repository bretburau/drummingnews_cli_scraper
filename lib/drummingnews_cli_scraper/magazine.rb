class DrummingNews::Magazine
  attr_accessor :name, :articles
  @@all = []
  def initialize(name)
    @name = name
    @@all << self
  end

  def self.create(name)
    self.new(name) unless self.all.include?(name)
  end

  def self.all
    output = []
    @@all.each do |e|
      output << e.name
    end
    output
  end
end