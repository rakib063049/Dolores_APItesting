module ApplicationHelper
  def formated_date(data)
    data.strftime("%b %d, %Y | %I:%M %p")
  end
end
