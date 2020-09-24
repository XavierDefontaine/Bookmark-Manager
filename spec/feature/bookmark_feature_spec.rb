require_relative '../database_helpers'

feature 'View /bookmarks route' do
  scenario 'See saved bookmarks' do
    add_urls 
    visit '/bookmarks'

    expect(page).to have_link('Makers_Academy', href: 'http://www.makersacademy.com')
    expect(page).to have_link('Destroy All Software',  href: 'http://www.destroyallsoftware.com')
    expect(page).to have_link('Google', href: 'http://www.google.com')
  end
end

feature 'Add a new bookmark' do
  scenario 'Add a bookmark' do
    add_urls
    visit('/bookmarks/add')
    fill_in('title', with: 'Apple')
    fill_in('url', with: 'www.apple.com')
    click_button("Submit")
    expect(page).to have_content "Apple"
  end
end

feature 'Delete a bookmark' do
  scenario 'Delete a bookmark' do
    add_urls
    visit('/bookmarks')
    click_button("Delete", :match => :first)
    expect(page).to have_no_link('Makers_Academy', href: 'http://www.makersacademy.com')
    expect(page).to have_link('Google', href: 'http://www.google.com')
  end
end

feature 'Update a bookmark' do
  scenario 'Update an existing bookmark' do
  add_urls
  visit('/bookmarks')
  click_button("Update", :match => :first)
  fill_in('title', with: 'Banana')
  fill_in('title', with: 'http://www.banana.com')
  click_button("Submit")
  expect(page).to have_no_link('Makers_Academy', href: 'http://www.makersacademy.com')
  expect(page).to have_link('Banana', href: 'bhttp://www.banana.com')
  end
end