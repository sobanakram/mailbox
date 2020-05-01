class Email < ApplicationRecord
  include Discard::Model

  belongs_to :user
  has_many_attached :attachments

  validates_presence_of :subject, :content
end
