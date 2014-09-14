require 'json'
require_relative 'settings'
Dir[File.dirname(__FILE__) + '/model/**/*.rb'].each { |file| require_relative file }