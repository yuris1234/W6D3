class LikesController < ApplicationController
    def create
        like = Like.new(like_params)
        if like.save 
            render json: like
        else
            render like.errors.full_messages, status = 404
        end
    end

    def destroy
        like = Like.find_by(id: params[:id])
        like.destroy
        render json: like
    end

    def index
        if params.has_key?(:query)
            like = Like.find_by(id: params[:query])
            render json: like
        else
            likes = Like.all
            render json: likes
        end
    end

    private
    def like_params 
        params.require(:like).permit(:liker_id, :likeable_type, :likeable_id)
    end
end