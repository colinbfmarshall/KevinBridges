class CreateTreatments < ActiveRecord::Migration[5.0]
  def change
    create_table :treatments do |t|
      t.string :name
      t.timestamps
    end
  end
end


# remember to remove the treatment string from the post model