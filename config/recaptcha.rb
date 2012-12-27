module Recaptcha
  SECRETS = begin
    YAML::load(File.open(File.join(File.dirname(__FILE__), 'secrets.yml')))
  rescue
    nil
  end


  def Recaptcha.get_pubkey
    SECRETS.nil? ? nil : SECRETS[:recaptcha][:public_key]
  end

  def Recaptcha.get_privkey
    SECRETS.nil? ? nil : SECRETS[:recaptcha][:private_key]
  end
end
