class PhotosController < ApplicationController
  before_action :authenticate?
  before_action :set_user
  before_action :set_url_options, only: [:index]
  def index
    @user_photos = @user.user_photos
  end

  def new
    @user_photo = @user.user_photos.build
  end

  def create
    @user_photo = @user.user_photos.build(user_photo_params)
    if @user_photo.save
      redirect_to user_photos_path(current_user)
    else
      render :new
    end
  end

  private

  def user_photo_params
    params.require(:user_photo).permit(:title, :image)
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_url_options
    ActiveStorage::Current.host = request.host
  end
end
