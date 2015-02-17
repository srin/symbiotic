class AnswerMailer < ApplicationMailer
	default from: "srinmadipalli@gmail.com"

	def answer_confirm(post, comment)
		@post = post
		@comment = comment

		mail(to: @post.user.email, cc: "smadipalli@hotmail.com", subject: "An answer has been posted to your question!")
	end	
end
