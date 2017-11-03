class EventsController < ApplicationController

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to root_path
    else
      flash[:error] = @user.errors.full_messages
      render 'new'
    end
  end

  def new
    @event = Event.new
  end

  def show
    @event = Event.find(params[:id])
  end

  def delete
  end

  def subscribe
  end

  def index
    @events = Event.all
  end

  private
  def event_params
    params.require(:event).permit(:description, :creator, :date, :place)
  end

end
