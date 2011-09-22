class RmApplication < ActiveResource::Base
  self.element_name = "application"
  self.site = YAML.load_file("#{Rails.root.to_s}/config/api_keys.yml")['roles']['uri']
  self.user = YAML.load_file("#{Rails.root.to_s}/config/api_keys.yml")['roles']['name']
  self.password = YAML.load_file("#{Rails.root.to_s}/config/api_keys.yml")['roles']['key']
  self.format = :xml
end
