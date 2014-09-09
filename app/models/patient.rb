class Patient < ActiveRecord::Base
  belongs_to :hospital
  has_many :medications
  has_many :doctors, as: :doctorable

  include Workflow 
  workflow do
    state :waiting_room do
      event :admitting, transitions_to: :admitted
      event :seeing_dr, transitions_to: :with_dr
    end
    state :with_dr do
      event :admitting, transitions_to: :admitted
      event :testing, transitions_to: :test
      event :cutting, transitions_to: :surgery
      event :preping, transitions_to: :prep_dis
    end
    state :admitted do
      event :seeing_dr, transitions_to: :with_dr
      event :testing, transitions_to: :test
      event :cutting, transitions_to: :surgery
      event :preping, transitions_to: :prep_dis
    end
    state :test do
      event :admitting, transitions_to: :admitted
      event :seeing_dr, transitions_to: :with_dr
      event :cutting, transitions_to: :surgery
    end
    state :surgery do
      event :admitting, transitions_to: :admitted
      event :seeing_dr, transitions_to: :with_dr
      event :testing, transitions_to: :test
    end
    state :prep_dis do 
      event :admitting, transitions_to: :admitted
      event :seeing_dr, transitions_to: :with_dr
      event :testing, transitions_to: :test
      event :cutting, transitions_to: :surgery
      event :leaving, transitions_to: :pay_bill
    end
    state :pay_bill 
  end

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates_date :dob, :on_or_before => lambda { Date.current }
end


