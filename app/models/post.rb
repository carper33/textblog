class Post < ActiveRecord::Base
  belongs_to :user
  before_save :set_slug

  validates :title, presence: true
  validates :body, presence: true


  def set_slug
    temp = self.title.parameterize

    if Post.where(slug: temp).where("id != ?", id).count > 0
      temp = "#{temp}-#{id}"
    end

    self.slug = temp
  end

  def to_param
    self.slug
  end

  def rendered
    $markdown.render(self.body)
  end
end
