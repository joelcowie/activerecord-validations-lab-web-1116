class Post < ActiveRecord::Base
  validate :clickbait
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }

  def clickbait
    unless title != nil && title.include?("Won't Believe" || "Secret" || "Top [number]" || "Guess")
      errors.add(:title, "needs more clickbait")
    end
  end
end
