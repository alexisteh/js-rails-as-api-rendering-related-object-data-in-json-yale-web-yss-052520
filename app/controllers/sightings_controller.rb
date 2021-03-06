class SightingsController < ApplicationController

    def index
        sightings = Sighting.all
        render json: sightings.to_json(include: [:bird, :location])
    end

    def show
        sighting = Sighting.find_by(id: params[:id])
        if sighting 
            # render json: {id: sighting.id, bird: sighting.bird, location: sighting.location}
            render json: sighting, include: [:bird, :location]
        else
            render json: {message: 'No Sighting Found'} 
        end 
    end

end
