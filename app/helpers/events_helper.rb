module EventsHelper
  def main_image(event)
    if event.main_image.attached?
      image_tag event.main_image
    else
      image_tag 'placeholder.jpg'
    end
  end

  def day_and_time(event)
    # event.event_date..to_formatted_s(:long_ordinal)
    event.event_date.strftime('%B %d at %I:%M %P')
  end

  def new_event_button
    !%w[past upcoming].include?(params[:filter]) && current_user
  end

  def index_heading
    if params[:filter] == 'past'
      'Past Events'
    elsif params[:filter] == 'upcoming'
      'Upcoming Events'
    else
      'All Events'
    end
  end

  def attendee?(event, user)
    event.attendees.include?(user)
  end

  def upcoming_date(event)
    event.event_date >= Time.now
  end
end
