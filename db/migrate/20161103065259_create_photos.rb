class CreatePhotos < ActiveRecord::Migration[8.0]
  def change
    create_table :photos do |t|
      t.string :type
      t.string :attach_type
      t.string :name
      t.string :attachment
      t.timestamps null: false
    end
  end
end
