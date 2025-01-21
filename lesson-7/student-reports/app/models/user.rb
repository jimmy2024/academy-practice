class User < ApplicationRecord
  has_many :lab_reports
  validates :email, :first_name, :last_name, presence: true
  validates :first_name, length: { maximum: 100 }
  validates :last_name, length: { maximum: 250 }
  validates :email, format: URI::MailTo::EMAIL_REGEXP, length: { maximum: 150 }

  def full_name
    "#{first_name} #{last_name}"
  end

end
