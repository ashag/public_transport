FactoryBot.define do
  factory :route do
    line_id { 1 }
    stop_id { 1 }
    current { true }
    arrival_time { '10:10:00' }
  end
end
