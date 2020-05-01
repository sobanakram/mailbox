class Email < ApplicationRecord
  include Discard::Model
  belongs_to :user

  validates_presence_of :subject, :content
end
