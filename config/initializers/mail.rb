ActionMailer::Base.smtp_settings = {
	address: "smtp.mandrillapp.com",
	port: 587,
	enable_starttls_auto: true,
	user_name: "srinmadipalli@gmail.com",
	password: "1P6UcgCLNGIZPc_-C_7qzQ",
	authentication: "login",
}

ActionMailer::Base.delivery_method = :smtp
ActionMailer::Base.default charset: "utf-8"