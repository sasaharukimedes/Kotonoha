class CreateReplies < ActiveRecord::Migration[6.0]
  def change
    create_table :replies do |t|
      t.string :dear
      t.text :content
      t.string :from
      t.int :post_id

      t.timestamps
    end
  end
end
