class NotificationsController < ApplicationController

  def index
    @notifications=current_user.passive_notifications.limit(20)
    @notifications.where(checked: false).each do |notif
      notification.update_attribute(:checked, "true")
    end
  end

end

