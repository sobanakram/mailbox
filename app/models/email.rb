class Email < ApplicationRecord
  include Discard::Model

  belongs_to :user
  has_many_attached :attachments

  enum _type: { sent: 0, received: 1, draft: 2 }

  validates_presence_of :subject, :content

  def url
    Rails.application.routes.url_helpers.rails_blob_url(object)
  end
end
