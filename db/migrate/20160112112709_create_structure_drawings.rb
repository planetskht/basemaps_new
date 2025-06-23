class CreateStructureDrawings < ActiveRecord::Migration[8.0]
  def change
    create_table :structure_drawings do |t|
      t.string :title
      t.text :description
      t.references :sub_project, index: true, foreign_key: true
      t.string :type
      t.string :group_type
      t.string :structure_type
      t.string :structure_label
      t.timestamps null: false
    end
  end
end
