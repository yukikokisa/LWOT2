class PatientList < ApplicationRecord
  has_many :patient
  validates :list, presence: true
end
