class SearchesController < ApplicationController

  def search
    @page_number = ReadingList.paginate(params)
    @reading_lists = ReadingList.search(params[:search])
    unless @reading_lists.blank?
      render :results
    else
      render :none_found
    end
  end
  
end
