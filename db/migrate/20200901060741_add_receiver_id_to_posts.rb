class AddReceiverIdToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :receiver_id, :integer
  end
end
