class PicturesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @pictures = Picture.includes(:user)
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
    if @picture.save
      redirect_to root_path
    else
      render :new
    end
     
  end

  def search
    @picture = Tweet.search(params[:search])
  end

  private
  def picture_params
    params.require(:picture).permit(:title, :explanation, :impression, :image).merge(user_id: current_user.id)
  end
end
