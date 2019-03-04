describe Stop do
  before do
    @stop = FactoryBot.create(:stop)
    5.times do |n|
      FactoryBot.create(:route, stop: @stop, arrival_time: Time.current + 4.seconds)
    end
  end

  context '#next_line_on_route' do
    it 'returns the next upcoming line' do
      expect(@stop.next_line_on_route.id).to eq 1
    end
  end

  context '#upcoming_routes' do
    it 'returns upcoming routes for stop' do
      expect(@stop.upcoming_routes(Route.last(5)).count).to eq 5
    end
  end
end
