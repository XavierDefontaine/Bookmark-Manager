require_relative '../database_helpers'

feature 'View /bookmarks route' do
  scenario 'See saved bookmarks' do
    add_urls 
    visit('/bookmarks')
    expect(page).to have_content('www.google.com')
  end
end

feature 'Add a new bookmark' do
  scenario 'Add a bookmark' do
    add_urls
    visit('/add_bookmark')
    fill_in('url', with: 'www.apple.com')
    click_button("Submit")
    expect(page).to have_content "www.apple.com"
  end
end
