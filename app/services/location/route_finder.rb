module Location
  class RouteFinder
    ROUTES_START = "10:00:00"
    ROUTES_END = "10:15:00"

    def self.call(quadrant: 1, x:, y:, time: Time.current)
      new(quadrant, x, y, time).lines_approaching
    end

    def lines_approaching
      raise ErrorHandler::NotFound.new(message: "Lines are not running") unless time_within_range?
      raise ErrorHandler::NotFound.new(message: "Nearby stops not found") unless stops_near_location.any?

      first_five_approaching.map(&:line)
    end

    private

    def initialize(quadrant, x, y, time)
      @quadrant = quadrant
      @x = x
      @y = y
      @time = time.seconds_since_midnight
    end

    def time_within_range?
      after_start_time && before_end_time
    end

    def after_start_time
      Time.parse(ROUTES_START).seconds_since_midnight <= @time
    end

    def before_end_time
      @time <= Time.parse(ROUTES_END).seconds_since_midnight
    end

    def stops_near_location
      quad_stops = Stop.stops_in_quadrant(@quadrant)

      quad_stops.select do |s|
        d1 = @x.to_i - s.x_coord
        d2 = @y.to_i - s.y_coord
        Math.sqrt(d1**2 + d2**2) <= 5 #arbitrary acceptance of distance
      end.pluck(:id)
    end

    def upcoming_routes
      stops_near_location.map do |sid|
        Route.future_routes(@time, sid)
      end.flatten
    end

    def first_five_approaching
      upcoming_routes.sort_by(&:arrival_time).first(5)
    end
  end
end
