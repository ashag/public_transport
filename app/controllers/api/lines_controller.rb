class Api::LinesController < ApplicationController
  def index
    index_query

    render json: @lines, serializer: object_serializer
  end

  private

  def index_query
    if params[:stop].present?
      stop = Stop.find_by(sid: params[:stop])
      @lines = stop.next_line_on_route
    elsif params[:x].present? && params[:y].present?
      time = params[:time].present? ? params[:time] : Time.current
      @lines = Location::RouteFinder.call(time: time, x: params[:x], y: params[:y])
    else
      @lines = Line.all
    end
  end

  def object_serializer
    Rails.logger.info "THIS IS THE  #{@lines.class}"
    ActiveModel::Serializer.serializer_for(@lines.class)
  end
end
