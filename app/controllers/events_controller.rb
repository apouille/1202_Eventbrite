class EventsController < ApplicationController
  # before_action :auth_user, only: [:show]

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

  def edit
    @event = Event.find(params[:id])
  end


  def update
    @event = Event.find(params[:id])
    puts "*"*100
    puts params
    puts "*"*100
    event_params = params.permit(:title, :description, :start_date, :duration, :price, :location)
    puts "*"*100
    puts event_params
    puts "*"*100
    if @event.update(event_params)
      redirect_to root_path
      else
      render :edit
      end
  end
  

    def destroy
    @event = Event.find(params[:id])
    if current_user.id == @event.administrator.id
    flash[:notice] = "Vous avez supprimé un événement avec succès"
    # else
    @event.destroy

    redirect_to root_path
    else
    flash[:notice] = "Vous n'êtes pas l'auteur de l'évenement"
    flash[:type] = "danger"
    render :edit
  end
  end


end



