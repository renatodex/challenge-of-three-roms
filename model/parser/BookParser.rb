class BookParser
	attr_accessor :roms, :platform
	
	def initialize(platform)
		self.platform = platform
		
		::JSON.load(open("#{Settings.database_path}/#{platform}.json")).each do |book|
			roms << build_rom(book)
		end
	end
	
	def roms
		@roms ||= []
	end
	
	def build_rom(book)
		rom = ::Rom.new
		rom.name = book["title"]
		rom.images << book["image_url"]
		rom.images << book["image_url"]
		rom.link = book["link"]
		rom.type = 'book'
		rom
	end
end