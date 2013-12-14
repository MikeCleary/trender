class ReadersController < ApplicationController
  
  # def authorise_twitter
  # end

  def create
    auth = request.env["omniauth.auth"]
    if !Reader.find_by(:name => auth.info[:name]).blank?
      @reader = Reader.find_by(:name => auth.info[:name])
      @reader.update_attributes(
      :access_token => auth.credentials[:token],
      :access_token_secret => auth.credentials[:secret]  
      )
    else
      @reader = Reader.create(
      :name => auth.info[:name],
      :access_token => auth.credentials[:token],
      :access_token_secret => auth.credentials[:secret]
    )
    end
    session[:logged_in] = true
    session[:reader_id] = @reader.id
    redirect_to :root
  end
end