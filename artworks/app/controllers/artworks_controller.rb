class ArtworksController < ApplicationController
    def index 
        if params.has_key?(:user_id)
            artwork = Artwork.where(artist_id: params[:user_id])
            render json: artwork
        else
            artworks = Artwork.all 
            render json: artworks
        end
    end

    def show 
        artwork = Artwork.find(params[:id])
        render json: artwork
    end

    def update
        artwork = Artwork.find(params[:id])
        if artwork.update(artwork_params)
            artwork.save!
            render json: artwork
        else
            render json: artwork.errors.full_messages, status: 409
        end
    end

    def create
        artwork = Artwork.new(artwork_params)
        if artwork.save
            render json: artwork 
        else 
            render json: artwork.errors.full_messages, status: 422
        end
    end

    def destroy
        artwork = Artwork.find_by(id: params[:id])

    end

    private
    def artwork_params
        params.require(:artwork).permit(:title, :image_url, :artist_id)
    end
end