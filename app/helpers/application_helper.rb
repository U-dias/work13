module ApplicationHelper
  def user_url(user)
    if user.photo.attached?
      url_for(user.photo)
    else
      ActionController::Base.helpers.asset_path('default_icon.png')
    end

  end

  def room_url(room)
    if room.photos.attached?
      url_for(room.photo[0])
    else
      ActionController::Base.helpers.asset_path('default_room.png')
    end

  end
end
