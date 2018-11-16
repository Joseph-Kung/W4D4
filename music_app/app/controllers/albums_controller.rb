class AlbumsController < ApplicationController

  def new
    @band = Band.find(params[:band_id])

    render :new
  end

  def show
    @album = Album.find(params[:id])
    @band = Band.find(@album.band_id)
    render :show
  end

  def update

  end

  def edit

  end

  def create
    album = Album.new(album_params)

    if album.save
      redirect_to album_url(album)
    else
      flash[:errors] = album.errors.full_error_messages
      redirect_to new_band_url
    end
  end

  def destroy

  end

  def album_params
    params.require(:album).permit(:title, :yr, :studio, :band_id)
  end
end
