class Rating
  attr_accessor :score, :movie, :viewer

  @@ratings = []

  def initialize(score, movie, viewer)
    @score = score
    @movie = movie
    @viewer = viewer
    self.class.all << self
  end

  def self.all
    @@ratings
  end

end
