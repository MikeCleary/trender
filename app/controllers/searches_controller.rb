class SearchesController < ApplicationController

  def search
    @page_number = ReadingList.paginate(params)
    if @reading_lists = ReadingList.search(params[:search])
      render 'reading_lists/index'
    else
      render :none_found
    end
  end
end
