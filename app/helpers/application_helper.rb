module ApplicationHelper

  def owner(object)
    if object.user == current_user
      true
    else
      false
    end
  end

end
