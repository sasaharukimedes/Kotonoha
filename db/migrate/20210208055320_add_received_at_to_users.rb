class AddReceivedAtToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :received_at, :datetime
  end
end
