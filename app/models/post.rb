class Post < ActiveRecord::Base
  belongs_to :user
  before_save :set_slug


  def set_slug
    self.slug = self.title.parameterize
  end

  def to_param
    self.slug
  end
end
