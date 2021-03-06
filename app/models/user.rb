class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :forums, dependent: :destroy 
  has_one :profile, dependent: :destroy
  has_many :comments, dependent: :destroy 
  def display_name
    profile&.nickname || self.email.split('@').first
  end
  def has_written?(forum)
    forums.exists?(id: forum.id)
  end

  def prepare_profile
    profile || build_profile
  end
  def avatar_image
    if profile&.avatar&.attached?
      profile.avatar
    else
      'profile.png'
    end
  end


end
