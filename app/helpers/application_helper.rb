module ApplicationHelper

  def omni_auth_url
    Rails.env == "production" ? "/trendr/auth/twitter" : "/auth/twitter"
  end 

end
