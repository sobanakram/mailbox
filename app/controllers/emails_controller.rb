class EmailsController < ApplicationController

  before_action :set_email, only: %i[show content]

  def index
    @emails = Email.with_attached_attachments.includes(:user).order(id: :desc)
  end

  def show
    render 'show', layout: false
  end

  def content
    render 'content', layout: false
  end

  def set_email
    @email = Email.find params[:id]
  end
end
