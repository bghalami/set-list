RSpec.describe 'visiting welcome page' do
  context 'as a visitor' do
    it 'should display a welcome message' do

      visit '/'

      within ('#greeting') do
        expect(page).to have_content('Welcome!')
      end
    end
  end
end
