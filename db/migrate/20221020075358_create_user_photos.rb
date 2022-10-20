class CreateUserPhotos < ActiveRecord::Migration[7.0]
  def change
    create_table :user_photos do |t|
      t.string :title, null: false
      t.references :user

      t.timestamps
    end
  end
end
