class Route < ApplicationRecord
  belongs_to :stop
  belongs_to :line

  scope :current_routes_by_stop, -> (stop_id) { where(current: true, stop_id: stop_id) }

  def self.future_routes(time_in_seconds, stop_id)
    where(current: true, stop_id: stop_id).select do |r|
      time_in_seconds <= r.arrival_time.seconds_since_midnight
    end
  end
end
