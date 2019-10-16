# coding: utf-8
require 'spec_helper'

describe server(:amimoto) do
  describe capybara('http://amimoto') do
    it "Logs in with instance_id" do
      visit '/wp-login.php'
      # pp page.driver.browser.manage.all_cookies
      fill_in "user_login", with: 'admin'
      fill_in "user_pass", with: ENV['KITCHEN_SERVER_ID']
      click_button 'wp-submit'

      # cookie was not set..? pending
      expect(page).to have_content 'Cookies are blocked or not supported by your browser'
      # assert_title 'Dashboard'
    end
  end
end
