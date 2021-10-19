class AddReceivedAtToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :received_at, :time
  end
end
