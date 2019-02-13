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

  def create
  # Amount in cents
  @amount = 500

  customer = Stripe::Customer.create(
    :email => params[:stripeEmail],
    :source  => params[:stripeToken]
  )

  charge = Stripe::Charge.create(
    :customer    => customer.id,
    :amount      => @amount,
    :description => 'Rails Stripe customer',
    :currency    => 'usd'
  )

	rescue Stripe::CardError => e
	  flash[:error] = e.message
	  redirect_to new_attendance_path
	end


end
