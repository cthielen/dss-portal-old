class Person < ActiveResource::Base
  self.site = YAML.load_file("#{Rails.root.to_s}/config/api_keys.yml")['roles']['uri']
  self.user = YAML.load_file("#{Rails.root.to_s}/config/api_keys.yml")['roles']['name']
  self.password = YAML.load_file("#{Rails.root.to_s}/config/api_keys.yml")['roles']['key']
  self.format = :xml

  # ACL symbols
  def role_symbols
    # Get this app's API key
    api_key = YAML.load_file("#{Rails.root.to_s}/config/api_keys.yml")['roles']['key']
    # Though we know this, let's keep it configurable in case it changes
    app_name = YAML.load_file("#{Rails.root.to_s}/config/api_keys.yml")['roles']['name']
    
    syms = []
    
    # Query for permissions of user via API key, converting them into declarative_authentication's needed symbols
    roles = RmApplication.find(app_name, :params => { :person_id => loginid }).roles
    roles.each do |role|
      syms << role.name.underscore.to_sym
    end
    
    syms
  end
end
