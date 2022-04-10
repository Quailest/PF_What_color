class CreatePhotos < ActiveRecord::Migration[6.1]
  def change
    create_table :photos do |t|
      t.string :title
      t.text :introduction
      t.string :location
      t.string :lens
      t.string :camera
      t.date :date

      t.timestamps
    end
  end
end
