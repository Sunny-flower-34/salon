class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
  # contentカラムが空の場合は保存しない+imageカラムが空の場合、contentカラムも空であれば保存しない
  validates :content, presence: true, unless: :image?
  # createの後にコミットする { MessageBroadcastJobのperformを遅延実行 引数はself }
  # after_create_commit { MessageBroadcastJob.perform_later self }
  mount_uploader :image, ImageUploader
end
