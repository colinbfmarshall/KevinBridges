class CreatePostTreatments < ActiveRecord::Migration[5.0]
  def change
    create_table :post_treatments do |t|
      t.references :treatment, foreign_key: true
      t.references :post, foreign_key: true
    end
  end
end
