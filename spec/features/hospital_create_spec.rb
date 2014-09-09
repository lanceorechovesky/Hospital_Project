require 'rails_helper'

describe "create hospital", type: :feature, js: true do
  it "should allow creation of hospital" do
    visit root_path
    click_link 'Sign Up'
    fill_in "Email", with: "test@example.com"
    fill_in "Password", with: "YoMoma1234"
    fill_in "Password confirmation", with: "YoMoma1234"
    click_button "Sign up"
    click_link "Hospitals"
    click_link "Add Hospital"
    fill_in "Hospital Name:", with: "test"
    fill_in "Hospital Address:", with: "YoMom's House"
    fill_in "Hospital Phone Number:", with: "YoMom's Number"
    click_button "Add"
    expect(page).to have_content("test")
    expect(page).to_not have_content("Sign in")
  end
end