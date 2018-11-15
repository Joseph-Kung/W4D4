class BandsController < ApplicationController
  def index
    @bands = Band.all

    render :index
  end

  def create
    band = Band.new(band_params)

    if band.save
      redirect_to bands_url(band)
    else
      flash[:errors] = ['Band name already taken']
      redirect_to new_band_url
    end
  end

  def new
    @band = Band.new

    render :new
  end

  def band_params
    params.require(:band).permit(:name)
  end

  def edit
    @band = Band.find(params[:id])

    render :edit
  end

  def update
    @band = Band.find(params[:id])

    if @band.update_attributes(user_params)
      redirect_to band_url(@band)
    else
      flash[:errors] = ['Invalid band name']
      redirect_to edit_band_url
    end
  end

  def destroy
    @band = Band.find(params[:id])
    @band.delete
    redirect_to bands_url
  end

  def show
    @band = Band.find(params[:id])

    render :show
  end

  def user_params
    params.require(:band).permit(:name)
  end
end
