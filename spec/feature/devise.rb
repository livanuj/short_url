require 'rails_helper'

RSpec.describe 'Signin and Signup process', type: :feature do
  let(:user) { create(:user) }
  let(:email) { "test2@example.com" }
  let(:password) { "test2@456" }

  it 'signs user in' do
    visit '/users/sign_in'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
    expect(current_path).to eq(root_path)
    expect(page).to have_text("Logged in as #{user.email}")
  end

  it 'sign up user' do
    visit '/users/sign_up'
    fill_in 'Email', with: email
    fill_in 'Password', with: password
    fill_in 'Password confirmation', with: password
    click_button 'Sign up'
    expect(current_path).to eq(root_path)
    expect(page).to have_text("Logged in as #{email}")
  end
end
