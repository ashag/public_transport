module ErrorHandler
  extend ActiveSupport::Concern

  class NotFound < StandardError
    attr_reader :message, :code
    def initialize(message: "Something went wrong", code: 500)
      @message = message
      @code = code
    end
  end

  included do
    rescue_from Exception do |exception|
      Rails.logger.warn("[API Exception] [#{exception.class.name}] #{exception.message}")
      render_error code: 500, message: "[#{exception.class.name}] #{exception.message}"
    end

    rescue_from 'ActiveRecord::RecordNotFound' do |exception|
      render_error code: 404, message: exception.message
    end

    rescue_from 'ActiveRecord::RecordInvalid' do |exception|
      render_error code: 400, message: exception.message
    end

    rescue_from 'ActionController::RoutingError' do |exception|
      render_error code: 404, message: exception.message
    end

    rescue_from 'NotFound' do |exception|
      render_error code: 404, message: exception.message
    end

    def render_error(code: 500, message: '', errors: {})
      error_hash = {}
      error_hash[:message] = message if message.present?
      error_hash[:errors] = errors if errors.keys.length > 0
      render json: error_hash, status: code
    end
  end
end
