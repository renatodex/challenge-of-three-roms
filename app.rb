require 'sinatra'
require_relative 'model/platform.rb'

set :views, Proc.new { File.join(root, "views") }

get "/" do
	
	["rom1", "rom2", "rom3"].each do |c|
		instance_variable_set "@#{c}", (Platform.new "snes").pick_rom
	end
	
	erb :index
end