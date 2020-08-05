class Post < ApplicationRecord
  belongs_to :user
  attachment :image

  with_options presence: true do
    validates :body

  end
end
