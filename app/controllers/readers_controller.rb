class ReadersController < ApplicationController
  
  # def authorise_twitter
  # end

  def create
    auth = request.env["omniauth.auth"]
    @reader = Reader.find_or_create_by(
      :name => auth.info[:name],
      :access_token => auth.credentials[:token],
      :access_token_secret => auth.credentials[:secret]
    )
    session[:logged_in] = true
    session[:reader_id] = @reader.id
    redirect_to :root
  end

end