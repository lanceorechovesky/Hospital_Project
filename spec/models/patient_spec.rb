require 'rails_helper'

RSpec.describe Patient, :type => :model do

  it "should belong to a hospital" do
    should belong_to(:hospital)
  end

  it "should have many medications" do
    should have_many(:medications)
  end

  it "should have many doctors" do
    should have_many(:doctors)
  end

  it "should not belong to a doctor" do
    should_not belong_to(:doctor)
  end

end