class Line < ApplicationRecord
  has_many :stops, through: :routes
  has_many :delays

  def current_delay?
    delays.where(current: true).exists?
  end
end
