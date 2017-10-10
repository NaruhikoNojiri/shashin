class PicturesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_picture, only:[:show, :edit, :update, :destroy]

  def index
    @pictures = Picture.order('id desc')
  end
  def new
    @picture = Picture.new
  end
  def show
  end
  def create
    @picture = Picture.new(pictures_params)
    @picture.user_id = current_user.id
    if @picture.save
      redirect_to pictures_path, notice: "写真を投稿しました！"
    else
      render :new
    end
  end
  def edit
  end
  def update
    if @picture.update(pictures_params)
      redirect_to pictures_path, notice: "投稿を編集しました！"
    else
      render :edit
    end
  end
  def destroy
    @picture.destroy
    redirect_to pictures_path, notice: "投稿を削除しました！"
  end

  private
    def pictures_params
      params.require(:picture).permit(:title,:content,:avatar,:avatar_cache)
    end

    def set_picture
      @picture = Picture.find(params[:id])
    end
end
