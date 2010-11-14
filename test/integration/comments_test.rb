require 'integration_test_helper'

class CommentTest < ActionController::IntegrationTest

  test "signed in user can see the unseen" do
    log_user
    assert page.has_content?('Matrix')
  end

  test "signed in user can submit secrets" do
    log_user
    visit('/secrets/new')
    fill_in 'secret[content]', :with => 'capybara-content'
    click_button('Add')
    # rails built-in assertions are not meant to work with capybara
    # assert_redirected_to secrets_path
    assert page.has_content?('capybara-content')
    assert page.has_content?('Secrets:')
  end

  test "signed in user can comment" do
    log_user
    visit('/secrets/new')
    fill_in 'secret[content]', :with => 'capybara-content'
    click_button('Add')
    # puts page.source
    # should redirect to "/secrets"
    assert page.has_no_content?('votes')
    visit('/secrets/1/comments/new')
    fill_in 'comment[content]', :with => 'dummy-comment'
    click_button('Comment')
    assert page.has_content?('0 votes')
  end
  
  test "signed in user can vote" do
    log_user
    visit('/secrets/new')
    fill_in 'secret[content]', :with => 'capybara-content'
    click_button('Add')
    visit('/secrets/1/comments/new')
    fill_in 'comment[content]', :with => 'dummy-comment'
    click_button('Comment')
    # should redirect to "/secrets"
    assert page.has_content?('0 votes')
    click_link('/\ bump')
    assert page.has_content?('1 votes')
    click_link('\/ down')
    assert page.has_content?('0 votes')
  end
end


