class UserMailer < ApplicationMailer
   default from: 'j.allstar@yopmail.com'
 
  def welcome_email(user)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user 

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://monsite.fr/login' 

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Bienvenue chez nous !') 
  end
  
  def new_guest_send(attendance)
   @attendance = attendance 
   @admin = User.find(@attendance.event.admin_id)

   @url  = 'http://monsite.fr/login' 

   mail(to: @user.email, subject: 'Bienvenue chez nous !') 
  end
end
