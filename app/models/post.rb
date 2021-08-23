# == Schema Information
#
# Table name: posts
#
#  id           :bigint           not null, primary key
#  title        :string
#  publish_date :date
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  published_at :datetime
#
class Post < ApplicationRecord
  has_many :likes
  has_many :users, through: :likes
end
