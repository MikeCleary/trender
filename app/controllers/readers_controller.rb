class ReadersController < ApplicationController
  
  def index
    @page_number = Reader.paginate(params)
    @readers = Reader.all.limit(10).offset(10 * @page_number)
  end

  def reading_lists
    @page_number = Reader.paginate(params)
    @reader = Reader.includes(:followed_lists).find(params[:id])
    @reading_lists = @reader.followed_lists.limit(10).offset(10 * @page_number)
    render 'reading_lists/index'
  end

  def show
    @reader = Reader.includes(:reading_lists => :stories).find(params[:id])
  end

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
    session[:reader] = @reader.name
    redirect_to :root
  end
end