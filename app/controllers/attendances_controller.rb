class AttendancesController < ApplicationController
   before_action :authenticate_user!, :get_current_event
   attr_accessor :user, :event
 
   def index
     @attendances = @event.attendances
   end
 
   def new
     @user = current_user
   end
 
   private
   def get_current_event
     @event = Event.find(params[:event_id])
   end

end


