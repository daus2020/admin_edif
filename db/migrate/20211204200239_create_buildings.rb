class CreateBuildings < ActiveRecord::Migration[6.1]
  def change
    create_table :buildings do |t|
      t.string :name
      t.text :address
      t.string :city
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
