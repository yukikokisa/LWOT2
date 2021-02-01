class Question < ApplicationRecord
  belongs_to :patient,  optional: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :consultation_content

  validates :consultation_content_id,  numericality: { other_than: 1 }, presence: true
  validates :subject,      length: { maximum: 30 }
  validates :detail,       length: { maximum: 200 }
end
