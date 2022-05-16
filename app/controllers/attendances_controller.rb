class AttendancesController < ApplicationController
   def index 
      @Attendances = Attendance.all
   end

   def show 

   end
end
