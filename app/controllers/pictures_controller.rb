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

  def show
    @picture = Picture.find(params[:id])
  end

  def edit
    @picture = Picture.find(params[:id])
    unless @picture.user_id == current_user.id
      redirect_to action: :index
    end
  end

  def update
    picture = Picture.find(params[:id])
    if picture.update(picture_params)
      redirect_to picture_path
    else
      render :edit
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
