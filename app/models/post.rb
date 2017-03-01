class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 250}
  validates :summary, length: {maximum: 250 }
  validates :category, inclusion: {in: %w(Fiction Non-fiction) }
  validate  :clickbait

  def clickbait
    
    if title.present? && title.scan(Regexp.union([/Won\'t Believe/, /Secret/, /Top\d/, /Guess/])).empty?
      errors.add(:title, "Title error")
    end
  end

end
