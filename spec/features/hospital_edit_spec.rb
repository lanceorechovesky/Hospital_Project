require 'rails_helper'

describe "edit hospital", type: :feature, js: true do
  it "should allow user to edit a hospital" do
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
    sleep 30
    within("#collapse_#{Hospital.last.id}") do
        # click_link "test's Data"
        click_link "View Data"
    end
    within("#bs-example-navbar-collapse-1") do
        click_link "test's Data"
    end
    fill_in "Hospital Name:", with: "Testing Yo Mom!"
    click_button "Edit"
  end
end
# "#collapse_#{Hospital.last.id}"












