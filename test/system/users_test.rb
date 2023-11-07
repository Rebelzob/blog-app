require 'application_system_test_case'

class UsersTest < ApplicationSystemTestCase
  test 'visiting the index' do
    visit users_url

    assert_selector 'h1', text: 'All Users'

    # Test to see if all users are displayed
    users(:one, :two).each do |user|
      assert_selector 'h2', text: user.name
      assert_selector "img[src='#{user.photo}']"
      assert_selector 'span', text: user.posts_counter.to_s
      click_on user.name
      assert_current_path user_path(user)
      click_on 'Back to Users'
    end
  end

  test 'visiting the show' do
    user = users(:one)
    posts(:one)
    visit user_url(user)

    assert_selector 'h2', text: user.name
    assert_selector "img[src='#{user.photo}']"
    assert_selector 'p', text: user.posts_counter.to_s
    assert_selector 'p', text: user.bio

    # Test to see if all posts are displayed
    user.posts.each do |post|
      within("#post-#{post.id}") do
        assert_selector 'a', text: post.title
        assert_selector 'p', text: post.text
        click_on post.title
      end
      assert_current_path user_post_path(user, post)
      click_on 'Back to User profile'
    end

    # Test to see if show all posts link works
    click_on 'See all Posts'
    assert_current_path user_posts_path(user)
  end
end
