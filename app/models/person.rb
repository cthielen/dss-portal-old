class Person < ActiveResource::Base
  self.site = YAML.load_file("#{Rails.root.to_s}/config/api_key.yml")['keys']['uri']
  self.user = "DSS Portal"
  self.password = YAML.load_file("#{Rails.root.to_s}/config/api_key.yml")['keys']['key']
end
