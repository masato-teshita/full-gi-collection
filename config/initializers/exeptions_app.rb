Rails.application.configure do
  config.exceptions_app = ErrorsController.action(:show)
end