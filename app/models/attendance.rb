class Attendance < ApplicationRecord
   belongs_to :user 
   belongs_to :event

   after_create :new_guest_send

   def new_guest_send
      UserMailer.new_guest_send(self).deliver_now
   end
end
