class Event < ApplicationRecord
   has_many :attendances
   has_many :users, through: :attendances


   validates :start_date, presence: true 
   validate :time_in_futur
   validates :duration, presence: true, numericality: { only_integer: true, greater_than: 0 }
   validate :multiple_of_5
   validates :title, length: {minimum: 3, maximum: 140}, presence: true 
   validates :description, length: {minimum: 20, maximum: 1000}, presence: true 
   validates :price, numericality: {only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 1000}
   validates :location, presence: true 



   def time_in_futur
      if start_date != nil
      if Time.now > start_date
        errors.add(:start_date, "date de départ peut pas être passée !")
      end
    end
    end

    def multiple_of_5
      if duration != nil
      if duration % 5 != 0
        errors.add(:duration, "durée doit être multiple de 5")
      end
    end
    end
end
