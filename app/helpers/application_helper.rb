module ApplicationHelper

  def user_thumb
    if current_user.thumbnail.attached?
      current_user.thumbnail.variant(resize: "100x100")
    else
      "/images/user/thumb/thumb-1.png"
    end
  end
end
