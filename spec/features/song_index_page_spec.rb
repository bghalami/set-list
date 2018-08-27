RSpec.describe 'song index page' do
  before(:each) do
    @playlist = Playlist.create(name: 'Playlist 1')
                    #verification for title and length
    @song_1 = @playlist.songs.create(title: "Song 1", length: 100, play_count: 1111111111)
    @song_2 = Song.create(title: 'Song 2', length: '48', play_count: 45)
  end
  context 'shows song details' do
    it 'should show all song names' do
      visit '/songs'

      expect(page).to have_content(@song_1.title)
      expect(page).to have_content(@song_2.title)
    end
    it 'should show song lengths' do
      visit '/songs'
      
      expect(page).to have_content("Song Length: #{@song_1.length}")
      expect(page).to have_content("Song Length: #{@song_2.length}")
    end
  end
end
