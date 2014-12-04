class CreateUploadedPictures < ActiveRecord::Migration
  def change
    create_table :uploaded_pictures do |t|
      t.string :picture

      t.timestamps
    end
  end
end
