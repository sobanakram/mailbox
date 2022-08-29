# == Schema Information
#
# Table name: emails
#
#  id           :bigint           not null, primary key
#  user_name    :string
#  user_email   :string
#  subject      :string
#  content      :text
#  discarded_at :datetime
#  user_id      :bigint           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
class Email < ApplicationRecord
  include Discard::Model

  belongs_to :user
  has_many_attached :attachments

  validates_presence_of :subject, :content

  def url
    Rails.application.routes.url_helpers.rails_blob_url(object)
  end

  def preview_url
    if object.previewable?
      Rails.application.routes.url_helpers.url_for(object.preview(resize_to_limit: [150, 150]))
    elsif object.variable?
      Rails.application.routes.url_helpers.url_for object.variant(resize_to_limit: [150, 150])
    end
  end
end
