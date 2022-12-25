class EmailsController < ApplicationController

  before_action :set_email, only: %i[show content]

  def index
    @pagy, @emails = pagy_cursor(Email.includes(:user).all, order: { id: :desc }, before: params[:before])
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
