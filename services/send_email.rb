require 'pony'
=begin
require './models/service'

Service.create(
    :code => 'send-email',
    :description => 'Send an email',
    :author => 'molari.alessandro@gmail.com',
    :open => true,
    :created_at => Time.now
)
=end

post '/services/send-email', :provides => :json do
  error_code = nil
  failed = false

  mail_args = [:to, :from, :subject, :body].collect do |param|
    unless params.has_key?(param.to_s)
      error_code = :"invalid_param_#{param}"
      failed = true
    end
    [param, params[param]]
  end
  mail_args = Hash[mail_args]

  unless failed
    if recaptcha_valid?
      begin
        Pony.mail(mail_args)
      rescue Exception => e
        failed, error_code = true, :send_mail
      end
    else
      failed, error_code = true, :invalid_captcha
    end
  end

  json({ :sent => !failed, :error_code => error_code })
end
