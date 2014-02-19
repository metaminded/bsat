require 'bootstrap-sass'
require 'font-awesome-rails'
require 'compass-rails'

module Bsat
  class Engine < ::Rails::Engine
    engine_name 'bsat'

    # Make helpers available to host app
    config.to_prepare do
      ActiveSupport.on_load(:action_controller) do
        helper Bsat::Engine.helpers
      end
    end
  end
end
