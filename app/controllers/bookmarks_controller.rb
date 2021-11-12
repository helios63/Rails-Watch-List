class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.movie_id = params[:movie_id]
    redirect_to movie_path(@bookmark.movie_id) if @bookmark.save
  end

  def destroy
    @bookmark = Bookmark.find(params[:id])
    redirect_to list_path(@bookmark.list) if @bookmark.destroy
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :list_id, :movie_id)
  end
end
