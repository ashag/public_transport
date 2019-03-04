class StopSerializer < ActiveModel::Serializer
  attributes :x_coord,
             :y_coord,
             :quadrant
end
