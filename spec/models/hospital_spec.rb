require 'rails_helper'

RSpec.describe Hospital, :type => :model do

  it "should have many patients" do
    should have_many(:patients)
  end

  it "should have many doctors" do
    should have_many(:doctors)
  end

  it "should not have many medications" do
    should_not have_many(:medications)
  end

  # it "put some text here to explain what the logic in the model should do" do
    # expect(hospital.method_being_tested).to eq("")
    # expect(hospital.method_being_tested).to be(300)
  # end  
end