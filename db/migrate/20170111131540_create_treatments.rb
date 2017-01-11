class CreateTreatments < ActiveRecord::Migration[5.0]
  def change
    create_table :treatments do |t|
      t.string :name
    end
  end
end
