class Viewer
  attr_accessor :first_name, :last_name

  @@viewers = []

  def initialize(name)
    @name = name
    self.class.all << self
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def self.all
    @@viewers
  end

  def self.find_by_name(name)
    @@viewers.find {|viewer| viewer.full_name == name}
  end

  def create_rating(score, movie)
    Rating.new(score, movie, self)
  end

end
