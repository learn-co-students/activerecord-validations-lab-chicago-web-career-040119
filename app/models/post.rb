class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validate :clickbaity_title

  # def clickbaity_title
  #   clickbaits = ["Won't Believe", "Secret", "Top [number]", "Guess"]
  #   if clickbaits.any? { |cbait| self.title.include?(cbait) }
  #     errors.add(:title, "title isn't clickbaty enough")
  #   end
  # end

  CLICKBAIT_PATTERNS = [
  /Won't Believe/i,
  /Secret/i,
  /Top [0-9]*/i,
  /Guess/i
]

def clickbaity_title
  if CLICKBAIT_PATTERNS.none? { |pat| pat.match title }
    errors.add(:title, "must be clickbait")
  end
end

end
