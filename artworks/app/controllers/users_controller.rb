class UsersController < ApplicationController
    def index 
        # render plain: "I'm in the index action!"
        users = User.all 
        render json: users
    end

    def create
        user = User.new(user_params)
        if user.save
          render json: user, status: :created
        else
          render json: user.errors.full_messages, status: 422
        end
    end

    def show
        user = User.find(params[:id])
        render json: user
        
    end

    def user_params
        params.require(:user).permit(:username)
    end

    def update
        user = User.find(params[:id])
        if user.update(user_params)
          render json: user
          user.save!
        else
          redirect_to user_url(user)
          render json: user.error.full_messages, status: 409
        end
    end

    def destroy
      user = User.find_by(id:params[:id])
      user.destroy
    end
end