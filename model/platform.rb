class Platform
	attr_accessor :roms, :platform
	
	def initialize(platform)
		self.platform = platform
		
		path = File.join(File.dirname(__FILE__), "#{database_path}/#{platform}.txt")
		File.read(path).each_line do |l|
			roms << l
		end
	end
	
	def pick_rom
		rom_name = roms.sample.gsub("\n", "")
		
		{
			:name => rom_name,
			:images => [
				"http://coolrom.com/screenshots/#{platform}/#{rom_name}.jpg",
				"http://coolrom.com/screenshots/#{platform}/#{rom_name} (2).jpg"
			]
		}
	end
	
	def roms
		@roms ||= []
	end
	
	def database_path
		"../raw_databases"
	end
end