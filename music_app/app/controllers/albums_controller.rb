class AlbumsController < ApplicationController

  def new
    @band = Band.find(params[:band_id])
    @album = Album.new

    render :new
  end

  def show
    @album = Album.find(params[:id])
    @band = Band.find(@album.band_id)
    render :show
  end

  def update
    album = Album.find(params[:id])

    if album.update_attributes(album_params)
      redirect_to album_url(album)
    else
      flash[:errors] = album.errors.full_error_messages
      redirect_to edit_album_url(album)
    end
  end

  def edit
    @album = Album.find(params[:id])
    @band = Band.find(@album.band_id)

    render :edit
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
    album = Album.find(params[:id])
    album.delete
    redirect_to bands_url
  end

  def album_params
    params.require(:album).permit(:title, :yr, :studio, :band_id)
  end
end
