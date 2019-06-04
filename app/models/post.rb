class Post < ApplicationRecord

  mount_uploader :image, ImageUploader

  belongs_to :category

  has_many :taggings
  has_many :tags, through: :taggings

  validates :title, presence: true,
                    length: { minimum: 3 }
  validates :summary, :body, presence: true,
                      length: { minimum: 5 }

  def all_tags
    self.tags.map(&:name).join(', ')
  end

  def all_tags=(names)
    self.tags = names.split(',').map do |name|
      Tag.where(name: name.strip).first_or_create
    end
  end
end
