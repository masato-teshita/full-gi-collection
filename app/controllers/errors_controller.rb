class ErrorsController < ApplicationController
  skip_before_action :authenticate_user!

  layout 'application'

  rescue_from StandardError, with: :error500
  rescue_from ActionController::RoutingError, with: :error404
  rescue_from ActiveRecord::RecordNotFound, with: :error404

  def error404(exception = nil)
    logger.info "Rendering 404 with exception: #{exception.message}" if exception
    redirect_to root_path
  end

  def error500(exception = nil)
    logger.info "Rendering 500 with exception: #{exception.message}" if exception
    redirect_to root_path
  end

  def show
   raise
  end
end