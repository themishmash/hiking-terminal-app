
#geocode testing

require "geocoder"
require "geocoder"
require 'activerecord'

class MyPlace < Geocoder::Model::ActiveRecord

    geocoded_by :address
    after_validation :geocode

    reverse_geocoded_by :latitude, :longitude
    after_validation :reverse_geocode

    def initialize(address)
        @address = address
    end

    def address
        @address
    end

end

mel_place = MyPlace.new("Melbourne, Victoria")

cowes = Geocoder.search("Cowes, Victoria")

mel_place.distance_to(cowes.latitude,cowes.longitude)




# mel = Geocoder.search("Melbourne, Victoria")
# puts mel.class
# puts mel[0].latitude
# results.first.address

# p results

# results = Geocoder.search("Melbourne, Victoria")
# results.first.address
# p results.first

#example
# results = Geocoder.search([48.856614, 2.3522219])
# results.first.address
# => "Hôtel de Ville, 75004 Paris, France"


# results = Geocoder.search("Mount Macedon")
# results.first.address
# p results.first

# results = Geocoder.search("Dandenong ranges")
# results.first.address
# p results.first



####need to restrict to Victoria
# results = Geocoder.search("Victoria, Australia")
# results.first.address
# p results.first

# results = Geocoder.search("Cowes, Victoria")
# results.first.address
# p results.first

#get user to enter place in Victoria and append Victoria to it

