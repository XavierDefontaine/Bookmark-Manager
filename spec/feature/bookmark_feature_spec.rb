require '../spec/database_helpers'

feature 'View /bookmarks route' do
  scenario 'See saved bookmarks' do
    add_urls 
    visit('/bookmarks')
    expect(page).to have_content('www.google.com')
  end
end

