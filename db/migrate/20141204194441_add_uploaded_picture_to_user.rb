class AddUploadedPictureToUser < ActiveRecord::Migration
  def change
    add_column :uploaded_pictures, :user_id, :integer
  end
end
