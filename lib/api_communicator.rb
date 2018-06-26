require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
 #make the web request
 all_characters = RestClient.get('http://www.swapi.co/api/people/')
 character_hash = JSON.parse(all_characters)
 film_array = []

character_found = character_hash["results"].find do |person|
person["name"].downcase == character
end

film_array = character_found["films"].map do |film|
 RestClient.get(film)
end
#parse_character_movies(film_hash_unparsed)

 # iterate over the character hash to find the collection of `films` for the given
 #   `character`
 # collect those film API urls, make a web request to each URL to get the info
 #  for that film
 # return value of this method should be collection of info about each film.
 #  i.e. an array of hashes in which each hash reps a given film
 # this collection will be the argument given to `parse_character_movies`
 #  and that method will do some nice presentation stuff: puts out a list
 #  of movies by title. play around with puts out other info about a given film.
end




def parse_character_movies(film_array)
 film_array.each do |film|
   film_variable = JSON.parse(film.body)
 puts film_variable["title"]
 end
end

def show_character_movies(character)
 film_array = get_character_movies_from_api(character)
 parse_character_movies(film_array)

end

## BONUS
