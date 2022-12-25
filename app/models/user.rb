# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  name                   :string
#  email                  :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  provider               :string           default("email"), not null
#  uid                    :string           default(""), not null
#  tokens                 :json
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  failed_attempts        :integer          default(0), not null
#  unlock_token           :string
#  locked_at              :datetime
#  _type                  :integer
#
class User < ApplicationRecord
  # include Trestle::Auth::ModelMethods::Rememberable
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
