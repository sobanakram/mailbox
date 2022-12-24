class EmailsController < ApplicationController

  before_action :set_email, only: %i[show content]

  def index
    @emails = Email.includes(:user).order(id: :desc)
  end

  def show
    @email.update(read: true)
    render 'show', layout: false
  end

  def content
    render 'content', layout: false
  end

  def set_email
    @email = Email.find params[:id]
  end
end
