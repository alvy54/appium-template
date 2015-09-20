module AppiumTemplate
	module SignInPage
		def self.login(username, password)
		  wait { textfield(1).type(username) }
		  textfield(2).type(password)
		  button('Sign In').click
		end
	end
end

module Kernel
	def sign_in_page
		AppiumTemplate::SignInPage
	end
end
