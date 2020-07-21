require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module FullGiCollection
  class Application < Rails::Application
    config.i18n.default_locale = :ja
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.yml').to_s]

    config.to_prepare do
      Administrate::ApplicationController.helper FullGiCollection::Application.helpers
    end
  end
end