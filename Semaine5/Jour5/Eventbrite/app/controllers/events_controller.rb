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
    @event = Event.find(params[:event])
    @user = User.find(params[:user])
    @event.attendees << @user
    redirect_to events_path
  end

  def unsubscribe
    @event = Event.find(params[:event])
    @user = User.find(params[:user])
    @event.attendees.delete(@user)
    redirect_to events_path
  end

  def index
    @events = Event.all
    @user = User.find(session[:user])
  end

  private
  def event_params
    params.require(:event).permit(:description, :creator, :date, :place)
  end

end
