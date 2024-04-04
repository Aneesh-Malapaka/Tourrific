class CreateDestinations < ActiveRecord::Migration[7.1]
  def change
    create_table :destinations do |t|
      t.string :dest_name
      t.text :location
      t.integer :rating
      t.text :main_photo
      t.references :tour_company, null: false, foreign_key: true

      t.timestamps
    end
  end
end
