# coding: utf-8
require 'spec_helper'

describe server(:amimoto) do
  describe capybara('http://amimoto') do
    it "Blocks invalid string" do
      visit '/wp-admin/install.php'
      fill_in "instance_id", with: 'hogehoge'
      click_button 'Next Step'
      expect(page).to have_content "Sorry, that isn’t a valid instance ID."
    end

    it "Unlock Success" do
      visit '/wp-admin/install.php'
      fill_in "instance_id", with: ENV['KITCHEN_SERVER_ID']
      expect(click_button 'Next Step').not_to be_nil
    end

    it "Should got 'Welcome' after unlock" do
      visit '/wp-admin/install.php'
      expect(page).to have_content 'ようこそ'
    end
  end
end
