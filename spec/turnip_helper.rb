require 'rails_helper'
require 'turnip/capybara'
require 'capybara/apparition'
Capybara.javascript_driver = :apparition
Capybara.default_max_wait_time = 5
Dir.glob("spec/features/steps/**/*") { |f| load f, true }