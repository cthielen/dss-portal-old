class SiteController < ApplicationController
  filter_access_to :index, :logout
  
  def index
    @messages = Message.find(current_user.loginid).messages
    
    # Determine if the user has any apps directly assigned to them (will generate extra tab)
    @has_special_apps = false
    current_user.apps.each do |app|
      if app.access == "direct"
        @has_special_apps = true
        break
      end
    end
  end
  
  def logout
    CASClient::Frameworks::Rails::Filter.logout(self)
  end

  def access_denied
  end

  def permission_denied
    redirect_to :controller => "site", :action => "access_denied"
  end
end
