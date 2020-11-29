class User < ApplicationRecord
  include Trestle::Auth::ModelMethods::Rememberable
  include Discard::Model
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :emails

  enum _type: { admin: 0, user: 1 }

  before_validation :init_uid

  # def name
  #   "#{first_name} #{last_name}"
  # end
  #
  # def name=(full_name)
  #   return if full_name.nil?
  #
  #   names = full_name.split(' ')
  #   self.first_name = names[0..-2].join(' ')
  #   self.last_name = names[-1] if names.size > 1
  # end

  # Region Self Methods
  def self.find_or_create_dummy(email, name)
    find_by_email(email) || create(email: email, name: name, password: Devise.friendly_token[0, 20])
  end

  private

  def init_uid
    self.uid = email if uid.blank? && provider == 'email'
  end
end
