class AttendancesController < ApplicationController

	def index
		puts "µ"*10
		puts params
		puts "µ"*10
	  @event = Event.find(params[:event_id])
		@attendance_all = @event.attendances
	end

	def new
	  @event = Event.find(params[:event_id])
		@attendance = Attendance.new
	end

  def create
  # Amount in cents
	@event = Event.find(params[:event_id])
  @amount = @event.price

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

  @attendance = Attendance.new(stripe_customer_id: charge[:customer], attendee: current_user, event: @event)

    if @attendance.save
      redirect_to event_path(params[:event_id])
    else
      flash[:danger] = "Il manque des informations"
      render :new 
    end
  end

end