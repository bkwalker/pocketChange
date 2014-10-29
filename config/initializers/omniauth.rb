OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '249587327081-gd5ud1u5krcb7jj56h38ht9d4kcu7fgl.apps.googleusercontent.com', 'ORas5O1QzWugxsxZiF5sgF5B',
    {
    	:scope => "email,profile",
	  	# client_options: {
	  	# 	ssl: {
	  	# 		ca_file: Rails.root.join("cacert.pem").to_s
	  	# 		}
  		# }
  	}
end