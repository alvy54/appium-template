module AppiumTemplate
	module HomePage
		def self.displayed?
			exists { wait { text_exact('Home') } }
		end
	end
end

module Kernel
	def home_page
		AppiumTemplate::HomePage
	end
end
