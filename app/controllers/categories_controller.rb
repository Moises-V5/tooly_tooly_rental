class CategoriesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
    @tools = Tool.where(category: @category)

    @markers = @tools.geocoded.map do |tool| 
      {
        lat: tool.latitude,
        lng: tool.longitude
      }
    end
  end
end
