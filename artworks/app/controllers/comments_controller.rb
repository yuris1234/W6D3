class CommentsController < ApplicationController
    def create
        comment = Comment.new(comment_params)
        if comment.save
            render json: comment
        else
            render json: comment.errors.full_messages, status: 422
        end
    end

    def destroy
        comment = Comment.find_by(id: params[:id])
        comment.destroy
        render json: comment
    end

    def index
        if params.has_key?(:user_id)
            comment = Comment.where(author_id: params[:user_id])
            render json: comment 
        elsif params.has_key?(:artwork_id)
            comment = Comment.where(artwork_id: params[:artwork_id])
            render json: artwork
        else
            comments = Comment.all
            render json: comments
        end
    end

    private
    def comment_params
        params.require(:comment).permit(:body, :author_id, :artwork_id)
    end
end