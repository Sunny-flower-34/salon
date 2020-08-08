class Room < ApplicationRecord
  has_many :room_users
  has_many :users, through: :room_users
  validates :name, presence: true, uniqueness: true
  has_many :messages


  def show_last_message
    if (last_message = messages.last).present?
      if last_message.content?
        last_message.content
      else
        '画像が投稿されています'
      end
    else
      'まだメッセージはありません。'
    end
  end
end
