class PicturesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def index
    
  end

  def new
    @picture = Picture.new
  end

  def create
    @picture = Picture.new(picture_params)
    @picture.save
     
  end

  def search
    @picture = Tweet.search(params[:search])
  end

  private
  def picture_params
    params.require(:picture).permit(:name, :image, :text).merge(user_id: current_user.id)
  end
end
