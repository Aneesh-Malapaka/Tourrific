class CreateTourCompanies < ActiveRecord::Migration[7.1]
  def change
    create_table :tour_companies do |t|
      t.string :company_name
      t.integer :rating
      t.text :description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
