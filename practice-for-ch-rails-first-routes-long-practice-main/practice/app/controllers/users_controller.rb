class UsersController < ApplicationController
    def index 
        # render plain: "I'm in the index action!"
        users = User.all 
        render json: users
    end

    def create
        user = User.new(params.require(:user).permit(:name, :email))
        if user.save
          render json: user
        else
          render json: user.errors.full_messages, status: :unprocessable_entity
        end
    end

    def show
        user = User.find(params[:id])
        render json: user
    end

    def user_params
        params.require(:user).permit(:name,:email)
    end

    def update
        user = User.find(params[:id])
        if user.update(user_params)
          render json: user
            # redirect_to_user_url(user)
            # render.user.error.full 
        end
    end

    def destroy
      user = User.find_by(id:params[:id])
      user.destroy
    end
end