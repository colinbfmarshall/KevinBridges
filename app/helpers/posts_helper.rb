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
    if post.stylist.present?
      return(link_to "By #{User.find_by(id: post.stylist).username}", profile_path(post.stylist))
    else
      return("#{post.user.username}")
    end
  end

  def searchbox_checked_checkbox(treatment, params)
    if params.present? 
      true if params.include?(treatment.id.to_s)
    else
      false
    end
  end

  def form_checked_checkbox(post, treatment)
    true if post.treatments.include?(treatment) 
  end

end
