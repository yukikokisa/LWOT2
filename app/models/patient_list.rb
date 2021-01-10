class PatientList < ApplicationRecord
  has_many :patients
  
  validates :list, presence: true
end
