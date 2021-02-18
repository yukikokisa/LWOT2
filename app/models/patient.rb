class Patient < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  has_many :questions
  belongs_to :patient_list, optional: true
  belongs_to :nurse,        optional: true

  VALID_PASSWORD_REGEX = /\A[a-z0-9]+\z/i
  validates :password, format: { with: VALID_PASSWORD_REGEX }

  with_options presence: true do
    validates :name,         length: { maximum: 10 }, format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :doctor,       format: { with: /\A[ぁ-んァ-ン一-龥]/ }
    validates :room_number,  format: /\A\d{3}[-]\d{1}\z/
  end

  def email_required?
    false
  end

  def email_changed?
    false
  end

  def will_save_change_to_email?
    false
  end
end
