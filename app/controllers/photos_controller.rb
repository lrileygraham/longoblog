class PhotosController < ApplicationController
    before_action :authenticate_user!, except: [:index,:show]
  def index
    @photos = Photo.all.order('created_at DESC')
  end

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.save
    if @photo.save
      redirect_to @photo
    else
      render 'new'
    end
  end

  def show
    @photo = Photo.find(params[:id])
  end


  def edit
    @photo = Photo.find(params[:id])
  end

  def update
    @photo = Photo.find(params[:id])
    if @photo.update(params[:photo].permit(:image))
      redirect_to @photo
    else
      render 'edit'
    end
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy

      redirect_to @photo
  end

  private
  def photo_params
    params.require(:photo).permit(:image)
  end

end
