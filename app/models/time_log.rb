class TimeLog < ActiveRecord::Base
  belongs_to :project
  belongs_to :user

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |time_log|
        csv << time_log.attributes.values_at(*column_names)
      end
    end
  end
end
