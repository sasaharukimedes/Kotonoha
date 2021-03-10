class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :dear
      t.text :content
      t.string :from


      t.timestamps
    end
  end
end
