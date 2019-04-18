class SearchKeywordsController < ApplicationController

  def index
    if params[:keyword].length != 0
      @brands = Brand.where('name LIKE(?)', "%#{params[:keyword]}%")
    end
      respond_to do |format|
        format.json
      end
  end
  private
end
