class ApplicationController < ActionController::Base
   include Blacklight::Controller
  # Please be sure to impelement current_user and user_session. Blacklight depends on 
  # these methods in order to perform user specific actions. 

  protect_from_forgery

  def layout_name
    "application"
  end
end
