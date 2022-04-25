class ChangeDatatypeDateOfPhotos < ActiveRecord::Migration[6.1]
  def change
    change_column :photos, :date, :string
  end
end
