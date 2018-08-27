RSpec.describe Playlist do
  describe 'Validations' do
    it 'has many songs' do
      association = described_class.reflect_on_association(:songs)
      expect(association.macro).to eq :has_many
    end
  end
end
