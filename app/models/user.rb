class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable,
  :omniauthable, :omniauth_providers => [:facebook]

  has_many :reservations
  #has_many :reservations, through: :reservations


  after_initialize :set_default_role, :if => :new_record?

  def set_default_role
    self.role ||= :visit
  end

  enum role: [:admin, :visit]


  def self.from_omniauth(auth)
      where(email: auth.info.email).first_or_initialize.tap do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
        user.name = auth.info.name
        user.save
      end
  end
end
