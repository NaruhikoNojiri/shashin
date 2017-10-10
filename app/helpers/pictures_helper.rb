module PicturesHelper
  def profile_picture(picture)
    return image_tag(picture.avatar, alt:'写真が表示できません')
  end
end
