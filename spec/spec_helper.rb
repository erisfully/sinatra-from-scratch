require "./app"
require "capybara/rspec"
ENV["RACK_ENV"] = "test"

Capybara.app = App