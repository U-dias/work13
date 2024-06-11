module ApplicationHelper
  def user_url(user)
    if user.photo.attached?
      url_for(user.photo)
    else
      ActionController::Base.helpers.asset_path('default_icon.png')
    end

  end
end
