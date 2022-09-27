require 'rails_helper'

RSpec.describe User, type: :feature do
  before(:each) do
    @user = User.create(name: 'Mileena', photo: 'https://lh3.googleusercontent.com/AopMRUHtSCq6oz5AOW5mK34urmGSBuBGj_XvwGOw9jtQ2rbpTv6J7RU3Mrof_gYs1xlwo490oUfjKBhQ2FLlCk-JioNhDvvbPkY=w960-rj-nu-e365')
  end

  describe 'Index page unit tests' do
    it 'shows the username' do
      visit root_path
      expect(page).to have_content(@user.name)
    end

    it 'shows the profile picture' do
      visit root_path
      expect(page).to have_css("img[src*='#{@user.photo}']")
    end

    it 'shows the number of posts' do
      visit root_path
      expect(page).to have_content(@user.posts.count)
    end

    it 'See more button should redirect to user profile' do
      visit root_path
      click_on 'See more'
      expect(page).to have_current_path(user_path(@user.id))
    end
  end
end
