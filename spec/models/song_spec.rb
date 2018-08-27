RSpec.describe Song do
  describe 'Class Methods' do
    describe '.total_play_count' do
      it 'should return total play count for all songs' do
        #setup
        Song.create(title: "Song 1", length: 100, play_count: 4)
        Song.create(title: "Song 2", length: 200, play_count: 5)
        #assertion           #expectations
        expect(Song.total_play_count).to eq(9)
      end
    end
    describe '.average_play_count' do
      it 'should return average of all play counts' do
        Song.create(title: "Song 1", length: 100, play_count: 20)
        Song.create(title: "Song 2", length: 200, play_count: 10)

        expect(Song.average_play_count).to eq(15)
      end
    end
  end
  describe 'Validations' do
    it 'is invalid without a title' do
      song = Song.create(length: 100, play_count: 0)

      expect(song).to_not be_valid
    end
    it 'is invalid without a length' do
      song = Song.create(title: 'spoop', play_count: 0)

      expect(song).to_not be_valid
    end
    it 'has one playlist' do
      association = described_class.reflect_on_association(:playlist)
      expect(association.macro).to eq :belongs_to
    end
  end
end
