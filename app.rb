require 'sinatra'
require_relative 'loader'

set :views, Proc.new { File.join(root, "views") }

get "/" do
	
	["rom1,snes,TxtParser", "rom2,snes,TxtParser", "rom3,snes,TxtParser"].each do |c|
		data = c.split(",")
		instance_variable_set "@#{data[0]}", (Platform.new data[1], Object.const_get(data[2])).pick_rom
	end
	
	erb :index
end

get "/with-book" do
	
	["rom1,snes,TxtParser", "rom2,books,BookParser", "rom3,snes,TxtParser"].each do |c|
		data = c.split(",")
		instance_variable_set "@#{data[0]}", (Platform.new data[1], Object.const_get(data[2])).pick_rom
	end
	
	erb :index
end