class AvatarsController < ApplicationController
   def create
      #nous permet d'identifier l'utilisateur concerné
      @user = User.find(params[:user_id])
      #Ensuite nous lui attribuons l'avatar 
      @user.avatar.attach(params[:avatar])
      #on redirige vers la page show de cet utilisateur en suivant la route dynamique
      redirect_to(user_path(@user))
    end
end
