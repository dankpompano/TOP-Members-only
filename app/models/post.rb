class Post < ApplicationRecord
  validates :topic, presence: true
  validates :body, presence: true
end
