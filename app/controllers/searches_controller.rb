class SearchesController < ApplicationController

  def search
    @page_number = ReadingList.paginate(params)
    if @reading_lists = ReadingList.search(params[:search])
      render :results
    else
      render :none_found
    end
  end
  
end
