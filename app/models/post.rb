class Post < ApplicationRecord
  # valaidates the title and body of the post to make sure they are not empty
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }
end
