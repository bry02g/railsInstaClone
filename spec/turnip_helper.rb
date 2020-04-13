require 'rails_helper'
require 'turnip/capybara'
require 'capybara/apparition'
Capybara.javascript_driver = :apparition
Dir.glob("spec/features/steps/**/*") { |f| load f, true }