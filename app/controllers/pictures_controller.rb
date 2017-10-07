class PicturesController < ApplicationController
  before_action :authenticate_user!
  def index
    @pictures = Picture.all
  end
  def new
    @picture = Picture.new
  end
  def show
    @picture = Picture.find(params[:id])
  end
  def create
    @picture = Picture.new(pictures_params)
    if @picture.save
      redirect_to pictures_path, notice: "写真を投稿しました！"
    else
      render :new
    end
  end
  def edit
    @picture = Picture.find(params[:id])
  end
  def update
    @picture = Picture.find(params[:id])
    if @picture.update(pictures_params)
      redirect_to pictures_path, notice: "投稿を編集しました！"
    else
      render :edit
    end
  end
  def destroy
    @picture = Picture.find(params[:id])
    @picture.destroy
    redirect_to pictures_path, notice: "投稿を削除しました！"
  end

  private
    def pictures_params
      params.require(:picture).permit(:title,:content)
    end
end
