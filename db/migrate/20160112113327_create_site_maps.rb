class CreateSiteMaps < ActiveRecord::Migration[8.0]
  def change
    create_table :site_maps do |t|
      t.string :title
      t.text :description
      t.string :from_km
      t.string :to_km
      t.string :group_type
      t.references :sub_project, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
