class PicturesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, except: [:index, :show, :search]

  def index
    @pictures = Picture.all.order("created_at DESC")
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
    @comment = Comment.new
    @comments = @picture.comments.includes(:user)
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
    @pictures = Picture.search(params[:keyword])
  end

  private
  def picture_params
    params.require(:picture).permit(:title, :explanation, :impression, :image).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
