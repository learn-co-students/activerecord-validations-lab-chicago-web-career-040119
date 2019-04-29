class ClickBaity < ActiveModel::Validator
  def validate(record)

    must_have_keywords = ["Won't Believe", "Secret", "Top ", "Guess"]
    must_have_keywords.each do |keyword|
      if record.title && record.title.downcase.include?(keyword.downcase)
        return true
      end
    end
    record.errors[:title] << 'Title must contain a click-baity keyword'
  end
end


class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250}
  validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
  validates_with ClickBaity
end
