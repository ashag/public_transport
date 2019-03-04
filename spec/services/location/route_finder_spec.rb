describe Location::RouteFinder do
  describe '#call' do
    describe 'errors' do
      it 'raises error message when request time is not within range' do
        expect {
          Location::RouteFinder.call(time: Time.parse("11:10:00"), x: 1, y: 4)
        }.to raise_error(ErrorHandler::NotFound)
      end

      it 'raises eror message when location is not within range of stops' do
        expect {
          Location::RouteFinder.call(time: Time.parse("11:10:00"), x: -8, y: -4)
        }.to raise_error(ErrorHandler::NotFound)
      end
    end

    describe 'success' do
      before do
        @route = FactoryBot.create(:route)
      end

      it 'returns lines within range of location and time' do
        subject = Location::RouteFinder.call(time: Time.parse("10:10:00"), x: 1, y: 4).first.id
        expect(subject).to eq 1
      end
    end
  end
end
