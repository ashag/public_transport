class LineSerializer < ActiveModel::Serializer
  attributes :line_id,
             :line_name,
             :minutes_delay

  def line_id
    object.lid
  end

  def minutes_delay
    if object.current_delay?
      object.delays.where(current: true).first.delay_in_minutes
    else
      0
    end
  end
end
