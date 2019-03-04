class RouteSerializer < ActiveModel::Serializer
  attributes :line,
             :stop,
             :arrival_time,
             :departure_time,
             :stop_number

  def line
    object.line
  end

  def stop
    object.stop
  end
end
