class Delay < ApplicationRecord
  belongs_to :line
  # add a cron that sets current: false after line is done with route
end
