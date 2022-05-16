class User < ApplicationRecord
  
   validates :first_name, presence: true 

   has_many :attendant_events, foreign_key: 'attendant_id', class_name: "Attendance"
   has_many :admin_events, foreign_key: 'admin_id', class_name: "Event"

  after_create :welcome_send

  def welcome_send
   UserMailer.welcome_email(self).deliver_now
  end
end
