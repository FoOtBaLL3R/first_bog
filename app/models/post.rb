class Post < ApplicationRecord
  validates :title, presence: true,
                    length: { minimum: 3 }
  validates :summary, :body, presence: true,
                      length: { minimum: 5 }
end
