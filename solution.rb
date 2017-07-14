# Please copy/paste all three classes into this file to submit your solution!
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

class Movie
  attr_accessor :title, :rating

  @@movies = []

  def initialize(title)
    self.title = title
    self.class.all << self
  end

  def self.all
    @@movies
  end

  def self.find_by_title(title)
    @@movies.select {|movie| movie.title == title}
  end

  def viewers
    self.ratings.map { |chosen_rating| chosen_rating.viewer }
  end

  def ratings
    Rating.all.select { |rating| rating.movie == self }
  end

  def average_rating
    count = sum = 0
    self.ratings.map do |rating| ; count += 1; sum += rating.score.to_f; end # (in case the score is entered as a string)
    average = sum / count
    average.round(2)
  end
end
