require 'pg'

feature 'add bookmark' do
  scenario 'a user can add a bookmark via a form on ' do
    connection = PG.connect(dbname: 'bookmark_manager_test') # do we need this? 
    visit('/addbookmark')
    fill_in('url', with: 'http://makersacademy.com')
    click_button ('Add')
    expect(page).to have_content 'http://makersacademy.com'
  end
end