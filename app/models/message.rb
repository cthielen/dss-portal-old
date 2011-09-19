class Message < ActiveResource::Base
  self.site = YAML.load_file("#{Rails.root.to_s}/config/api_keys.yml")['messages']['uri']
  self.user = YAML.load_file("#{Rails.root.to_s}/config/api_keys.yml")['messages']['name']
  self.password = YAML.load_file("#{Rails.root.to_s}/config/api_keys.yml")['messages']['key']
  self.format = :xml
end
