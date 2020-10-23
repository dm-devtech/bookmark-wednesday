feature 'deletes bookmark' do
  scenario 'user is able to delete bookmark from database' do
    Bookmark.new_bookmark(url: "http://www.destroyallsoftware.com", title: "Destroy All Software")
    visit('/delete_bookmark')
    fill_in('title', with: 'Destroy All Software')
    click_button "Submit"
    visit('/bookmarks')
    expect(page).to_not have_content "Destroy All Software"
  end
end