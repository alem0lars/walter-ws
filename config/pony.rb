class PonyConfig

  def initialize env
    if env == :development
      configure_development()
    elsif env == :production
      configure_production()
    end
  end

  def configure_development
    Pony.options = {
      :via => :smtp,
      :via_options => {
        :address => 'localhost',
        :port => '1025'
      }
    }
  end

  def configure_production
    Pony.options = {
      :via => :smtp,
      :via_options => {
        :address => 'smtp.sendgrid.net',
        :port => '587',
        :domain => 'molarialessandro-webservices.heroku.com',
        :user_name => ENV['SENDGRID_USERNAME'],
        :password => ENV['SENDGRID_PASSWORD'],
        :authentication => :plain,
        :enable_starttls_auto => true
      }
    }
  end

end

