OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '249587327081-4up3p24k5sb0nt01hht00tuj9mtfoksv.apps.googleusercontent.com', 'J3YedAEG5Mjnljt5hL71E5wY', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end
