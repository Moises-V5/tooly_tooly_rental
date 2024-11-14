class ToolsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:show]
  before_action :tool_set, only: [:show, :edit, :update, :destroy]
  
  def show
  end

  def new
    @tool = Tool.new
  end

  def create
    @tool = Tool.new(tool_params)
    @tool.user = current_user
    if @tool.save
      redirect_to tool_path(@tool), notice: "Tool added!"
    else
      render :new, notice: "We couldn't add that tool, try again!"
    end
  end

  def edit
  end

  def update
    if @tool.update(tool_params)
      redirect_to tool_path(@tool), notice: "Tool updated!"
    else
      render :edit, notice: "We couldn't update that tool, try again!"
    end
  end

  def destroy
    if @tool.destroy
      redirect_to tool_path, notice: "Tool deleted!"
    else
      render :new, notice: "We couldn't delete that tool, try again!"
    end
  end

  private

  def tool_set
    @tool = Tool.find(params[:id])
  end

  def tool_params
    params.require(:tool).permit(:name, :description, :price, :address, :category_id, photos: [])
  end
end
