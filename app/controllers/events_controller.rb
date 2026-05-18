class EventsController < ApplicationController
  def index
    @events = Event.order(date: :asc)
    @new_event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to root_path }
      end
    else
      respond_to do |format|
        format.turbo_stream { render turbo_stream: turbo_stream.replace("new_event_form", partial: "events/new_event_form", locals: { event: @event }) }
        format.html { redirect_to root_path }
      end
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    respond_to do |format|
      format.turbo_stream { render turbo_stream: turbo_stream.remove("event_#{@event.id}") }
      format.html { redirect_to root_path }
    end
  end

  def update
    @event = Event.find(params[:id])
    update_attrs = params.require(:event).permit(:date, :host_name, :address, :celebration_date)
    @event.update(update_attrs.transform_values { |v| v.presence })
    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to root_path }
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :date, :celebration_date)
  end
end
