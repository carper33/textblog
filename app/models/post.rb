class Post < ActiveRecord::Base


	after_save :guardar_foto

	FOTOS= File.join Rails.root, 'public', 'photo_store'

  belongs_to :user
  before_save :set_slug

  def set_slug
    self.slug = self.title.parameterize
  end

  def to_param
    self.slug
  end

  def photo=(file_data)

  	unless file_data.blank?
  		@file_data = file_data
  		self.extension = file_data.original_filename.split('.').last.downcase	
  	end
  	
  end

  def photo_filename
  	File.join FOTOS, "#{id}"
  end

  # "rutabase"
  def photo_path
  	"/photo_store/#{id}"
  end

  def has_photo?

  	File.exists? photo_filename
  	
  end

private 

	def guardar_foto
  		if @file_data
  			FileUtils.mkdir_p Fotos
  			File.open(photo_filename, 'wb') do |f|
  				f.write(@file_data.read)
  			end
  			@file_data= nil
  		end
	end
end
