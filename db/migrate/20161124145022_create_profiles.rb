class CreateProfiles < ActiveRecord::Migration[5.0]
  def change
    create_table :profiles do |t|
      t.references :user, foreign_key: true
      t.string :username
      t.string :first_name
      t.string :last_name
      t.string :mobile
      t.text :about
      t.string :salon
      t.string :salon_website
      t.string :postcode
      t.string :city
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
