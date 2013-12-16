module Paginationate

  def paginate(params=nil)
    @page_number = params[:page_number].to_i if params[:page_number]
    @page_number ||= 0
  end

  def self.included(klass)
    klass.extend Paginationate
  end
  
end