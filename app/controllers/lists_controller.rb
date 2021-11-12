class ListsController < ApplicationController
  def index
    @lists = List.all
    @list = List.new
  end

  def show
    @list = List.find(params[:id])
    @bookmarks = Bookmark.where(list_id: @list.id)

  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    redirect_to lists_path if @list.save
  end

  def destroy
    @list = List.find(params[:id])
    redirect_to lists_path if @list.destroy
  end

  private

  def list_params
    params.require(:list).permit(:name)
  end
end
