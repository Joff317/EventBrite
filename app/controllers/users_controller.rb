class UsersController < ApplicationController
   before_action :set_user, only: %i[ show edit update destroy ]
   before_action :authenticate_user!, only: [:show, :edit, :update, :destroy]
   

   def index 
      @users = User.all
   end

   def show 
      @events = Event.all 
   end


   private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:email, :encrypted_password, :description, :first_name, :last_name)
    end
end
