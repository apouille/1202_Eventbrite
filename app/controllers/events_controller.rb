class EventsController < ApplicationController

	def index
		@event_all = Event.all
	end

	def show
		@event = Event.find(params[:id])
	end

	def new
		@event = Event.new
	end

  def create
  	@event = Event.new(title: params[:title], description: params[:description], price: params[:price], location: params[:location], duration: params[:duration], start_date: params[:start_date], administrator_id: current_user.id)
    if @event.save
      redirect_to root_path
      flash[:notice] = "Vous avez crée votre événemement avec succès"

    else
      render "new"
    end
	end

end
