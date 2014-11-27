class User < ActiveRecord::Base
	has_many :posts

	def file_column
	file_column :image
	end


end
