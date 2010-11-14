require "test_helper"
require "capybara/rails"

require 'factory_girl'
Dir["#{File.dirname(__FILE__)}/factories/*.rb"].each {|f| require f} 


module ActionController
  class IntegrationTest
    include Capybara

    def log_user
      visit '/users/sign_in'
      @user = Factory( :user )
      fill_in 'user[username]', :with => @user.username
      fill_in 'user[password]', :with => @user.password
      click_button('Sign in')
      # post :create
      #, :user => {:email => "test@test.com", :username => "testuser", :password => "123456", :password_confirmation => "123456"}
      # assert page.has_content?('Matrix')
    end


  end
end

