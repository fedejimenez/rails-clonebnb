# Reduce loading time (like storing email if server fails)
# gem sidekiq

# development file (config/enviroment)
config.active_job.queue_adapter = :sidekiq

# install redis
# redis server


# folloe the tutorial...........

class ReservationJob < ApplicationJob
	queue_as :default

	def perform(booking)
		ReservationMailer.booking_email(booking).deliver_later
		# goes to the queue and send it when it can
	end
end

# in booking_controller 
	def confirmation
	
		ReservationJob.perform_later(@booking)
	end


