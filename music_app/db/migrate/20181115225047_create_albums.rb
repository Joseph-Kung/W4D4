class CreateAlbums < ActiveRecord::Migration[5.2]
  def change
    create_table :albums do |t|
      t.string :title, null: false
      t.integer :yr, null: false
      t.boolean :studio, null: false, default: true

      t.timestamps
    end
  end
end
