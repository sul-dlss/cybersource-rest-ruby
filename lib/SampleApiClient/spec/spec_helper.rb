require 'simplecov'
SimpleCov.start
require 'simplecov-json'
require_relative '../controller/APIController.rb'
SimpleCov.formatters = [
  SimpleCov::Formatter::HTMLFormatter,
  SimpleCov::Formatter::JSONFormatter,
]


