class AddSenderIdToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :sender_id, :integer
  end
end
