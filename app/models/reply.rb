class Reply < ApplicationRecord
  belongs_to :post
  has_many :notifications, dependent: :destroy

  validates :dear, presence: true,
                    length: {maximum:25}
  validates :content, presence: true,
                      length: {maximum:200}
  validates :from, presence: true,
                    length:{maximum:25}
  validates :post_id, presence: true

  #リプライ作成通知メソッド
  #基本的にポストもリプライも通知送るタイミングと性質上同じ書き方で行けるはず

  def create_reply_notification_by(current_user)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and reply_id = ? and action =?", current_user.id, user_id, id, 'reply'])
    if temp.blank?
      notification = current_user.active_notifications.new(
        reply_id: id,
        visited_id: user_id,
        action: 'reply'
      )
      notification.save if notification.valid?
    end
  end

end
