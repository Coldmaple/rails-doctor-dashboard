require 'open-uri'
require 'json'

class AppointmentsController < ApplicationController

    def index
        # Fetch appointments json file from an API endpoint
        
        url = "https://api.jsonbin.io/b/5ac194b4656b6e0b857bf80d/1" 
        begin
            buffer = open(url).read
        # Handle the http error
        rescue OpenURI::HTTPError => error
            response = error.io
            puts response.string
        end
        
        result = JSON.parse(buffer)
        result["Appointments"].each do |data|

            # Check if the appointment is already existed
            flag = Appointment.where(:appointmentId => data["id"]).any?
            if flag != true
                @appointment = Appointment.new(
                    :appointmentId => data["id"],
                    :date => data["start_date"], 
                    :time => data["start_time"], 
                    :doctorName => data["physician_name"],
                    :lastAppointment => data["last_appoint_date"],
                    :symptoms => data["symptoms"],
                    )
                @appointment.save
            end

        @appointments = Appointment.all
        end
    end

    def detail
        @appointment = Appointment.where(:appointmentId => params[:id]).take
    rescue ActiveRecord::RecordNotFound
        render json: { error: error.message }, status: :not_found
    end

    

end
