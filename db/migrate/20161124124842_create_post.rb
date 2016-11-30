class CreatePost < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.references :user, foreign_key: true
      t.string :comment
      t.string :treatment
      t.string :gender
      t.string :price
      t.timestamps
    end
  end
end
