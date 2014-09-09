require 'rails_helper'

RSpec.describe Medication, :type => :model do

  it "should belong to a patient" do
    should belong_to(:patient)
  end

  it "should not belong to a hospital" do
    should_not belong_to(:hospital)
  end

  it "should not have many doctors" do
    should_not have_many(:doctors)
  end

  it "should not belong to a doctor" do
    should_not belong_to(:doctor)
  end

end