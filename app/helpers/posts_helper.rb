module PostsHelper
  include ActsAsTaggableOn::TagsHelper

  def likes(post)
    if post.get_likes.size == 1
      "#{post.get_likes.size} like"
    else post.get_likes.size > 1
      "#{post.get_likes.size} likes"
    end
  end

end
