class Post < ApplicationRecord
  belongs_to :user
  attachment :image
  # has_many :images, dependent: :destroy
  # accepts_nested_attributes_for :images, allow_destroy: true

  has_many :comments, dependent: :destroy
  with_options presence: true do
    validates :body

  end
end
