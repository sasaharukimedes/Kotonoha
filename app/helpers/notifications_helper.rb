module NotificationsHelper
  def notification_form(notification)
    visitor=notification.visitor.username #, style:"font-weight: bold;"
    visitor_post=notification.visitor.username, notification.post#, style:"font-weight: bold;"
    your_reply=link_to "あなたの手紙", notification.reply#, style:"font-weight: bold;", remote: true

    case notification.action
      when "post" then
        "#{visitor_post}から手紙が届きました！"
      when "reply" then
        "#{visitor}が#{your_reply}に返事をくれました！"
    end
  end

  def unchecked_notifications
    @notifications=current_user.passive_notifications.where(checked: false)
  end

end
