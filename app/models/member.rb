class Member < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :fullname, :address, :phone, :email, 
                  :name, :administrator, :password, :password_confirmation
  attr_accessor :password, :password_confirmation

  has_many :reviews, dependent: :destroy
  has_many :review_trips, through: :reviews, source: :trip
  has_many :reservations, dependent: :destroy

 validates :name, presence: true,
    uniqueness: true
  validates :fullname, length: { maximum: 20 }
  #validate :check_email
  validates :password, presence: { on: :create }, confirmation: { allow_blank: true }

  def password=(val)
    if val.present?
      self.hashed_password = BCrypt::Password.create(val)
    end
    @password = val
  end

 def check_email
    if email.present?
      errors.add(:email, :invalid) unless well_formed_as_email_address(email)
    end
  end

  class << self

    def authenticate(name, password)
      member = find_by_name(name)
      if member && member.hashed_password.present? &&
         BCrypt::Password.new(member.hashed_password) == password
        member
      else
        nil
      end
    end
  end
end
