# frozen_string_literal: true

require_relative 'support/controller_macros'

RSpec.configure do |config|
  # For Devise > 4.1.1
  config.include Devise::Test::ControllerHelpers, type: :controller
  # Use the following instead if you are on Devise <= 4.1.1
  # config.include Devise::TestHelpers, :type => :controller
  config.extend ControllerMacros, type: :controller
  config.navigational_formats = []
end
