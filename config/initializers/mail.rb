ActionMailer::Base.smtp_settings = {
	address: "smtp.mandrillapp.com",
	port: 587,
	enable_starttls_auto: true,
	user_name: "srinmadipalli@gmail.com",
	password: "Mi3ekR3v9M8LhiyjZ6o21Q",
	authentication: "login",
}

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.default charset: "utf-8"