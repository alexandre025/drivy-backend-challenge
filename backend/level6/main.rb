require 'json'
require 'Time'
require './database'
require './models/car'
require './models/rental_base'
require './models/rental'
require './models/rental_modification'
require './models/commission'


class Main

  def initialize
    # I chose to create an object 'Database' which load a json file, parse the datas into objects based on my models
    @data = Database.new('./data.json')
  end

  # Function used to create the output.json
  def export_prices
    # h = {rentals: []}
    # @data.rentals.each do |r|
    #   h[:rentals] << r.rental_calculator
    # end

    h = {rental_modifications: []}
    @data.rental_modifications.each do |rm|
      h[:rental_modifications] << rm.rental_calculator
    end

    output = File.open('output.json','w')
    output << JSON.generate(h)
    output.close

    'Prices exported'
  end

end
