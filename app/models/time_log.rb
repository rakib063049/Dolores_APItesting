class TimeLog < ActiveRecord::Base
  belongs_to :project
  belongs_to :user

  before_save :set_time_logged
  scope :by_project, ->(project_ids) { where(project_id: project_ids) }

  def self.to_csv(project_ids)
    CSV.generate do |csv|
      csv << ["Id", "End at", "Started at", "Logged", "User Name", "Project Name"]
      TimeLog.by_project(project_ids).each do |tlg|
        csv << [tlg.id, tlg.start_at.strftime("%b %d, %Y | %I:%M %p"), tlg.end_at.strftime("%b %d, %Y | %I:%M %p"), tlg.time_logged_str, tlg.user.name, tlg.project.name]
      end
    end
  end

  def time_logged_str
    seconds = logged.to_f % 60
    minutes = (logged.to_f / 60) % 60
    hours = logged.to_f / (60 * 60)
    return format("%02d:%02d:%02d", hours, minutes, seconds)
  end

  private
  def set_time_logged
    self.logged=(self.end_at - self.start_at)
  end
end
