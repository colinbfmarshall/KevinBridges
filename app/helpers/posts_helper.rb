module PostsHelper
  include ActsAsTaggableOn::TagsHelper

  def likes(post)
    if post.get_likes.size == 1
      "#{post.get_likes.size} like"
    else post.get_likes.size > 1
      "#{post.get_likes.size} likes"
    end
  end

  def stylist(post)
    User.find_by(id: post.stylist).username
  end

  def checked_checkbox(treatment, params)
    if params.present? 
      true if params.include?(treatment.id.to_s)
    else
      false
    end
  end

end
