module Twilio
	class SmsService
		TWILIO_ACCOUNT_SID= 'AC899a750c035c55083a5c9a5d2109588a'
		TWILIO_AUTH_TOKEN= '0981d415927a9fbee201ec8aec4092e8'
		TWILIO_FROM_PHONE= '+16187871747'
		TWILIO_TEST_PHONE=  '+918319445401'



		def call 
			byebug
			@client = Twilio::REST::Client.new(TWILIO_ACCOUNT_SID, TWILIO_AUTH_TOKEN)
			message = @client.messages.create(
				body: 'how are you om ?, I hope you are fine',
				from: '+16187871747',
				to: '+918319445401'
				)
			puts message.sid
		end
	end
end


