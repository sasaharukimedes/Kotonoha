class Post < ApplicationRecord
  belongs_to :user

  validates :dear, presence: true,
                    length: {maximum:20}
  validates :content, presence: true,
                      length: {maximum:200}
  validates :from, presence: true,
                    length:{maximum:20}
  validates :sender_id, presence: true
  validates :receiver_id, presence: true
end
