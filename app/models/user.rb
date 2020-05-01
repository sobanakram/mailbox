class User < ApplicationRecord
  include Discard::Model
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :emails

  enum _type: { admin: 0, user: 1 }

  def name
    "#{first_name} #{last_name}"
  end

  def name=(full_name)
    names = full_name.split(' ')
    self.first_name = names[0]
    self.last_name = names[-1].join(' ') if names.size > 1
  end

  # Region Self Methods
  def self.find_or_create_dummy(email, name)
    find_by_email(email) || create(email: email, name: name, password: Devise.friendly_token[0, 20])
  end
end
