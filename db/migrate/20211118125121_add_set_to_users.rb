class AddSetToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :username, :string
    add_column :users, :birthday, :date
    add_column :users, :received_at, :datetime
  end
end
