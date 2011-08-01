class Person < ActiveResource::Base
  self.site = "http://dss-rm.dev/api/"
  self.user = "DSS Portal"
  self.password = YAML.load_file("#{Rails.root.to_s}/config/api_key.yml")['keys']['key']
end
