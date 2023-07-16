module Twilio
	class SmsService
		TWILIO_ACCOUNT_SID= 'AC899a750c035c55083a5c9a5d2109588a'
		TWILIO_AUTH_TOKEN= 'bb081b50f0eeab3a56a3ce635cc262ac'
		TWILIO_FROM_PHONE= '+16187871747'
		TWILIO_TEST_PHONE=  '+919340994804'



		def call 
			byebug
			@client = Twilio::REST::Client.new(TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN)
			message = @client.messages.create(
				body: 'how are you janak lodhi ?, I hope you are fine',
				from: '+16187871747',
				to: '+919340994804'
				)
			puts message.sid
		end
	end
end



