module PostsHelper
  def post_form_url(post)
    if post.new_record?
      posts_path(current_user.username)
    else
      post_path(current_user.username, post.slug)
    end
  end
end
