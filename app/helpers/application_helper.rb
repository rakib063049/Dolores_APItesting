module ApplicationHelper
  def formated_date(data)
    return "" if data.nil?
    data.strftime("%b %d, %Y | %I:%M %p")
  end

  def total_time_logged_str(logged)
    seconds = logged.to_f % 60
    minutes = (logged.to_f / 60) % 60
    hours = logged.to_f / (60 * 60)
    return format("%02d:%02d:%02d", hours, minutes, seconds)
  end

  def country(id)
    Country.find(id).name rescue ""
  end

  def state(id)
    State.find(id).name rescue ""
  end
end
