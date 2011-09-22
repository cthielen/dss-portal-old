class SiteController < ApplicationController
  filter_access_to :index, :logout
  
  def index
    @messages = Message.find(current_user.loginid).messages
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
