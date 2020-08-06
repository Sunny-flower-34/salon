class Post < ApplicationRecord
  belongs_to :user
  attachment :image
  has_many :comments, dependent: :destroy
  with_options presence: true do
    validates :body

  end
end
