class UserMailer < ActionMailer::Base
	default from: 'your-email@example.com'

	def welcome_email(user)
		@user = user
		mail(to: @user.email, subject: 'Welcome to My App')
	end
end
