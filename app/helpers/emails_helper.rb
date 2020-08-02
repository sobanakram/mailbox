module EmailsHelper

  def attachment_url(object)
    Rails.application.routes.url_helpers.rails_blob_url(object)
  end

  def attachment_preview_url(object)
    if object.previewable?
      Rails.application.routes.url_helpers.url_for(object.preview(resize_to_limit: [150, 150]))
    elsif object.variable?
      Rails.application.routes.url_helpers.url_for object.variant(resize_to_limit: [150, 150])
    end
  end
end
