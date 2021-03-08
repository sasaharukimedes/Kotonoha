class Reply < ApplicationRecord
  belongs_to :post

  validates :dear, presence: true,
                    length: {maximum:25}
  validates :content, presence: true,
                      length: {maximum:200}
  validates :from, presence: true,
                    length:{maximum:25}
  validates :post_id, presence: true
end
