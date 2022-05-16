class Attendance < ApplicationRecord
   belongs_to :attendant, class_name: "User" 
   belongs_to :event
   

   after_create :attendance_email

   def attendance_email
      UserMailer.attendance_email(self).deliver_now
   end
end
