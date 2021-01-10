class Question < ApplicationRecord
  belongs_to :patient,  optional: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :consultation_content

  with_options presence: true do
    validates :consultation_content_id,  numericality: { other_than: 1 } 
    validates :subject,      length: { maximum: 30 }
    validates :detail,       length: { maximum: 200 }
  end
end
