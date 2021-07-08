module ApplicationHelper

  def user_thumbnail(user = current_user)
    if user.thumbnail.attached?
      user.thumbnail
    else
      "/images/user/thumb/thumb-1.png"
    end
  end

  def prize_thumbnail(prize)
    if prize.thumbnail.attached?
      prize.thumbnail
    else
      "/images/prize/default.jpg"
    end
  end
end
