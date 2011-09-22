class SiteController < ApplicationController
  filter_access_to :index, :logout
  
  def index
  end
  
  def logout
    CASClient::Frameworks::Rails::Filter.logout(self)
  end

  def access_denied
  end

  def permission_denied
    #flash[:error] = "Sorry, you are not allowed to access that page."
    redirect_to :controller => "site", :action => "access_denied"
  end
end
