class User < ActiveRecord::Base
	has_many :posts

	validates :nombre, presence:true
	validates :email, presence:true
	validates :ciudad, presence:true

	def file_column
	file_column :image
	end


end
