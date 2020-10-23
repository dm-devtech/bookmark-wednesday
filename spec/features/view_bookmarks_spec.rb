require 'pg'

feature 'Viewing bookmarks' do
  scenario 'Visit bookmark page' do
    Bookmark.new_bookmark(url: "http://www.destroyallsoftware.com", title: "Destroy All Software")
    Bookmark.new_bookmark(url: "http://www.google.com", title: "Google")
    Bookmark.new_bookmark(url: "http://www.makersacademy.com", title: "Makers")

    visit '/bookmarks'

    expect(page).to have_content "Destroy All Software"
    expect(page).to have_content "Google"
    expect(page).to have_content "Makers"
  end
end

feature 'Adding bookmarks' do
  scenario 'Visit add bookmark page' do
    visit '/addbookmark'
    fill_in('url', with: 'http://bbc.co.uk/sport')
    fill_in('title', with: 'BBC Sport')
    click_button "Submit"
    expect(page).to have_content "BBC Sport"
  end
end
