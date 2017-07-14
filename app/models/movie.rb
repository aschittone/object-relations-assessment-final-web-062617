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
