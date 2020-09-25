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
    fill_in('url', with: 'http://www.apple.com')
    click_button("Submit")
    expect(page).to have_content "Apple"
  end
  scenario 'Checks if the URL is valid' do
    visit('/bookmarks/add')
    fill_in('title', with: 'Apple')
    fill_in('url', with: 'xxx.apple.com')
    click_button("Submit")
    expect(page).to have_content "Incorrect URL"
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
  fill_in('url', with: 'http://www.banana.com')
  click_button("Submit")
  expect(page).to have_no_link('Makers_Academy', href: 'http://www.makersacademy.com')
  expect(page).to have_link('Banana', href: 'http://www.banana.com')
  end
end

feature 'Add a comment' do
  scenario 'Add comment by a bookmark' do
    add_urls
    visit('/bookmarks')
    click_button("Comment", :match => :first)
    fill_in('comment', with: 'yo waddup')
    click_button("Submit")
    expect(page).to have_content('yo waddup')
  end
end