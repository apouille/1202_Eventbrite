class AttendancesController < ApplicationController

	def index
		puts "µ"*10
		puts params
		puts "µ"*10
	  @event = Event.find(params[:format])
		@attendance_all = @event.attendances
	end

	def show
		@attendance = Attendance.find(params[:id])
	end

	def new
		@attendance = Attendance.new
	end

end
