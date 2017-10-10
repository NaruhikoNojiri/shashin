class Picture < ActiveRecord::Base
  mount_uploader :avatar, AvatarUploader
  belongs_to :user
  validates :title, :content, :avatar, presence: true
end
