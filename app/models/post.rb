class Post < ApplicationRecord
  validates :dear, presence: true,
                    length: {maximum:20}
  validates :content, presence: true,
                      length: {maximum:200}
  validates :from, presence: true,
                    length:{maximum:20}
end
