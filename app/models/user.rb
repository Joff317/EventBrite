class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
   #validates :first_name, presence: true 

   has_many :attendant_events, foreign_key: 'attendant_id', class_name: "Attendance"
   has_many :admin_events, foreign_key: 'admin_id', class_name: "Event"
   has_one_attached :avatar 

  after_create :welcome_send

  def welcome_send
   UserMailer.welcome_email(self).deliver_now
  end
end
