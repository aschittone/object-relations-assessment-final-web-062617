require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

viewer = Viewer.new("andrew")
movie = Movie.new("gladiator")
rating = viewer.create_rating(3, movie)
# rating = viewer.create_rating(3, movie)
# rating = viewer.create_rating(10, movie)

Pry.start
