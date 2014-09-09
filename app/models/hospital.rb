class Hospital < ActiveRecord::Base
  has_many :patients
  has_many :doctors, as: :doctorable

  validates :name, presence: true
  validates :address, presence: true
end
