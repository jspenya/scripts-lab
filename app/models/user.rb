class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :likes
  has_many :posts, through: :likes
  has_many :channel_users, dependent: :destroy
  has_many :channels, through: :channel_users
  has_many :messages, dependent: :destroy
  has_many :meetings, dependent: :destroy

  def likes?(post)
    post.likes.where(user_id: id).any?
  end
end
