class Stop < ApplicationRecord
  has_many :lines, through: :routes

  scope :stops_in_quadrant, -> (quad_number) { where(quadrant: quad_number) }

  def next_line_on_route
    route_stop = upcoming_routes(current_routes)

    if route_stop.any?
      route_stop.sort_by(&:arrival_time).first.line
    else
      raise ErrorHandler::NotFound.new(message: "No lines arriving in the future")
    end
  end

  def current_routes
    Route.current_routes_by_stop(self.id)
  end

  def upcoming_routes(routes)
    routes.select do |r|
      r.arrival_time.seconds_since_midnight > Time.current.seconds_since_midnight
    end
  end
end
