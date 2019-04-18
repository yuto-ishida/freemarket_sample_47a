class SearchKeywordsController < ApplicationController

  def index
    @brands = Brand.where('name LIKE(?)', "%#{params[:keyword]}%") if params[:keyword].length != 0
    respond_to do |format|
      format.json
    end
  end
  private
end
