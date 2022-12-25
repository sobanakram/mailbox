class ApplicationController < ActionController::Base
  require "pagy_cursor/pagy/extras/cursor"

  include Pagy::Backend
  before_action :authenticate_user!
end
